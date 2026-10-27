# この formula は jp-pii-detector のリリースワークフロー
# （.github/workflows/release.yml の homebrew ジョブ）が
# scripts/jp-pii-detect.rb.tmpl からリリースごとに自動生成し
# baneido/homebrew-tap へ push する。手動で編集しないこと。
#
# Go 不要の方針に合わせ、ソースからビルドせず Release のビルド済みバイナリを
# ダウンロードして展開する formula にしている。
# version は URL（releases/download/<tag>/）から Homebrew が自動で読み取るため書かない
# （書くと brew audit が「redundant version」と指摘する）。
class JpPiiDetect < Formula
  desc "Static PII detector for Japan (My Number, phone, address, etc.)"
  homepage "https://github.com/baneido/jp-pii-detector"

  on_macos do
    on_arm do
      url "https://github.com/baneido/jp-pii-detector/releases/download/v0.9.0/jp-pii-detect_darwin_arm64.tar.gz"
      sha256 "06ff4e321e1558df8900c97ad086660381ee1a1a818cc6c2142cc24ffe32fd0c"
    end
    on_intel do
      url "https://github.com/baneido/jp-pii-detector/releases/download/v0.9.0/jp-pii-detect_darwin_amd64.tar.gz"
      sha256 "0bde132a65ff87e1fad26112cf586f76b4a391ca341a505700a818b3676998df"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/baneido/jp-pii-detector/releases/download/v0.9.0/jp-pii-detect_linux_arm64.tar.gz"
      sha256 "e9f291b2575d63d69bf1e827e7a0189d3eb4f5d4b9b74765288c1b3a030204c2"
    end
    on_intel do
      url "https://github.com/baneido/jp-pii-detector/releases/download/v0.9.0/jp-pii-detect_linux_amd64.tar.gz"
      sha256 "165a16cd1eff3c32c21293519f5cd7e7b63d8da52f82ea119a8785354dc5f456"
    end
  end

  def install
    bin.install "jp-pii-detect"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/jp-pii-detect version")
  end
end
