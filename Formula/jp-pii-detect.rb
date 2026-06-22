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
  version "0.2.3"

  on_macos do
    on_arm do
      url "https://github.com/baneido/jp-pii-detector/releases/download/v0.2.3/jp-pii-detect_darwin_arm64.tar.gz"
      sha256 "0c9895df14f68526f4a9cae0c93c4370e355d87b2c9601ed413c99a69877c2b6"
    end
    on_intel do
      url "https://github.com/baneido/jp-pii-detector/releases/download/v0.2.3/jp-pii-detect_darwin_amd64.tar.gz"
      sha256 "9bb33ccad9b3e940d7101919a474deb15540d3dbccc0647840a732a9692c25c6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/baneido/jp-pii-detector/releases/download/v0.2.3/jp-pii-detect_linux_arm64.tar.gz"
      sha256 "f865cbdd3b33539c1010b9c3e4e0f3a16c0886bf6240db68e24c9a38f444b979"
    end
    on_intel do
      url "https://github.com/baneido/jp-pii-detector/releases/download/v0.2.3/jp-pii-detect_linux_amd64.tar.gz"
      sha256 "2626e5a0b68319251b97f59df893bb74d47f371626af2aab5f23e497711084ba"
    end
  end

  def install
    bin.install "jp-pii-detect"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/jp-pii-detect version")
  end
end
