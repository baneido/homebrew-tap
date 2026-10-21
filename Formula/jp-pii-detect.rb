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
  version "0.8.1"

  on_macos do
    on_arm do
      url "https://github.com/baneido/jp-pii-detector/releases/download/v0.8.1/jp-pii-detect_darwin_arm64.tar.gz"
      sha256 "9aa8e93dd33ed54d7356149d3652e9329a550cbb1fc3ad7c43ed799d9325aa7c"
    end
    on_intel do
      url "https://github.com/baneido/jp-pii-detector/releases/download/v0.8.1/jp-pii-detect_darwin_amd64.tar.gz"
      sha256 "f2420fd708de85b15d9ef0bfc5a5b5a6fdc14f276e73feaa1da58691f2fce30d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/baneido/jp-pii-detector/releases/download/v0.8.1/jp-pii-detect_linux_arm64.tar.gz"
      sha256 "4370abf5ae6c9b96150a4cd4662f1eeebcd9449612157d171ca26fb9aa9fa301"
    end
    on_intel do
      url "https://github.com/baneido/jp-pii-detector/releases/download/v0.8.1/jp-pii-detect_linux_amd64.tar.gz"
      sha256 "1fdfeace6b18ad781158a04c9a568bf3b73bf9db76ec6ecbca8f0e233cfd7b01"
    end
  end

  def install
    bin.install "jp-pii-detect"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/jp-pii-detect version")
  end
end
