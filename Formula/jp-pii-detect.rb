# この formula は jp-pii-detector のリリースワークフロー
# （.github/workflows/release.yml の homebrew ジョブ）が
# scripts/jp-pii-detect.rb.tmpl からリリースごとに自動生成し
# baneido/homebrew-tap へ push する。手動で編集しないこと。
#
# Go 不要の方針に合わせ、ソースからビルドせず Release のビルド済みバイナリを
# ダウンロードして展開する formula にしている。
class JpPiiDetect < Formula
  desc "Static PII detector for Japan (My Number, phone, address, etc.)"
  homepage "https://github.com/baneido/jp-pii-detector"
  version "0.3.5"

  on_macos do
    on_arm do
      url "https://github.com/baneido/jp-pii-detector/releases/download/v0.3.5/jp-pii-detect_darwin_arm64.tar.gz"
      sha256 "8fd3de851801f3734afb2ab5aa4e3765ea8e9c42676ce2c5f7bbde8709f23507"
    end
    on_intel do
      url "https://github.com/baneido/jp-pii-detector/releases/download/v0.3.5/jp-pii-detect_darwin_amd64.tar.gz"
      sha256 "486264e2fbe46226e59ab07e93d3125c00202c9b96189a4bb75769f54f5f3ef6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/baneido/jp-pii-detector/releases/download/v0.3.5/jp-pii-detect_linux_arm64.tar.gz"
      sha256 "8794a5d74b3b99a4ae1dda60e61c3e4c73461cd59045c0219a61f07ddd07382f"
    end
    on_intel do
      url "https://github.com/baneido/jp-pii-detector/releases/download/v0.3.5/jp-pii-detect_linux_amd64.tar.gz"
      sha256 "2fd01be2d86bcdc695057806b3ee29dda31fed68643a53c35a80b9cc27c37daa"
    end
  end

  def install
    bin.install "jp-pii-detect"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/jp-pii-detect version")
  end
end
