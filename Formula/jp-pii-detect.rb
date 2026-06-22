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
  version "0.3.0"

  on_macos do
    on_arm do
      url "https://github.com/baneido/jp-pii-detector/releases/download/v0.3.0/jp-pii-detect_darwin_arm64.tar.gz"
      sha256 "db053f708c81f2242180692d82160b26aeffa4c55e774c822b69bc079e8c43e5"
    end
    on_intel do
      url "https://github.com/baneido/jp-pii-detector/releases/download/v0.3.0/jp-pii-detect_darwin_amd64.tar.gz"
      sha256 "e8dea2e32a140976412d8862881c9fb039f12e05d643be0eebd2acce21bf5caf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/baneido/jp-pii-detector/releases/download/v0.3.0/jp-pii-detect_linux_arm64.tar.gz"
      sha256 "6efb7bbf5facbfdd51398bf06077da74be727510d546a5cd70f81d8694976869"
    end
    on_intel do
      url "https://github.com/baneido/jp-pii-detector/releases/download/v0.3.0/jp-pii-detect_linux_amd64.tar.gz"
      sha256 "2b22c537c7fa0d7d7e302cfd5a7af59febbd14d0cf07fb14b8bdf50b9c793ce3"
    end
  end

  def install
    bin.install "jp-pii-detect"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/jp-pii-detect version")
  end
end
