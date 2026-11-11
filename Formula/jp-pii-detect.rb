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
      url "https://github.com/baneido/jp-pii-detector/releases/download/v0.9.4/jp-pii-detect_darwin_arm64.tar.gz"
      sha256 "f1e9cebefba2dd58b8e9cdc87c7aa65a8619cfb41ad01316cfd55417d0bd8976"
    end
    on_intel do
      url "https://github.com/baneido/jp-pii-detector/releases/download/v0.9.4/jp-pii-detect_darwin_amd64.tar.gz"
      sha256 "8138bdbfd4f2d93e953fd8583e0599399cff36159d37221533e9625e82d5333f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/baneido/jp-pii-detector/releases/download/v0.9.4/jp-pii-detect_linux_arm64.tar.gz"
      sha256 "60962e26bf79c12651760a84b30da4abc4cf329c5ef5b68d35016386f5f164b8"
    end
    on_intel do
      url "https://github.com/baneido/jp-pii-detector/releases/download/v0.9.4/jp-pii-detect_linux_amd64.tar.gz"
      sha256 "104062ca1c2aafbecf07a168428adda43887d0b026b1e877c6d0f59f02ee51ea"
    end
  end

  def install
    bin.install "jp-pii-detect"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/jp-pii-detect version")
  end
end
