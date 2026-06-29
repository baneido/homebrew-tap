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
  version "0.3.6"

  on_macos do
    on_arm do
      url "https://github.com/baneido/jp-pii-detector/releases/download/v0.3.6/jp-pii-detect_darwin_arm64.tar.gz"
      sha256 "c93268c554a4327cf9d1e0cf3d18a397ff1823f89b914e6f0d2bb322ab4d75f8"
    end
    on_intel do
      url "https://github.com/baneido/jp-pii-detector/releases/download/v0.3.6/jp-pii-detect_darwin_amd64.tar.gz"
      sha256 "84ec0b299706811d4c66743b44773bea8ba8d37346a98881190481222fba308d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/baneido/jp-pii-detector/releases/download/v0.3.6/jp-pii-detect_linux_arm64.tar.gz"
      sha256 "4b00d0e6bccd0c03dc1a5bf3653a700ae935896b303a12608cf95f5480912a94"
    end
    on_intel do
      url "https://github.com/baneido/jp-pii-detector/releases/download/v0.3.6/jp-pii-detect_linux_amd64.tar.gz"
      sha256 "364535c0f6d53b1436da792659cd7a384b765edf2cc2bd6686c70817757333fb"
    end
  end

  def install
    bin.install "jp-pii-detect"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/jp-pii-detect version")
  end
end
