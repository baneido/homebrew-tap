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
  version "0.4.2"

  on_macos do
    on_arm do
      url "https://github.com/baneido/jp-pii-detector/releases/download/v0.4.2/jp-pii-detect_darwin_arm64.tar.gz"
      sha256 "1aae791183b8af7fda3a926f47c154af8562768ffcee8cc7b70b568066b19797"
    end
    on_intel do
      url "https://github.com/baneido/jp-pii-detector/releases/download/v0.4.2/jp-pii-detect_darwin_amd64.tar.gz"
      sha256 "ac3cebd5540ad48573c0f6b1a7ea2288be7767bfd4990671eee48cb662ac16c2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/baneido/jp-pii-detector/releases/download/v0.4.2/jp-pii-detect_linux_arm64.tar.gz"
      sha256 "ad82f44f59c04c14ad2c417165d40e2c64d774ee7eeadd719d1e00659b56d9c8"
    end
    on_intel do
      url "https://github.com/baneido/jp-pii-detector/releases/download/v0.4.2/jp-pii-detect_linux_amd64.tar.gz"
      sha256 "db8cb9852e44fcbcd6b6e540ad88ae4866dd5c8771c155bfd56fc8f30d9a1ec9"
    end
  end

  def install
    bin.install "jp-pii-detect"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/jp-pii-detect version")
  end
end
