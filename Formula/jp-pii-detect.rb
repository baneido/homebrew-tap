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
  version "0.5.0"

  on_macos do
    on_arm do
      url "https://github.com/baneido/jp-pii-detector/releases/download/v0.5.0/jp-pii-detect_darwin_arm64.tar.gz"
      sha256 "85d85b3e77c545a10848450a438dde0c427133ed9b6912eac9ce17a2b61de064"
    end
    on_intel do
      url "https://github.com/baneido/jp-pii-detector/releases/download/v0.5.0/jp-pii-detect_darwin_amd64.tar.gz"
      sha256 "ab97a80d6684ac2312216a244b4a141cb4aa14c36be381201817f0a7e31583eb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/baneido/jp-pii-detector/releases/download/v0.5.0/jp-pii-detect_linux_arm64.tar.gz"
      sha256 "b68cb96bbb345428c5f77fd8bf2d6bd8a25de8cc5c1f5cd626195fca57fb4d4f"
    end
    on_intel do
      url "https://github.com/baneido/jp-pii-detector/releases/download/v0.5.0/jp-pii-detect_linux_amd64.tar.gz"
      sha256 "bec4f0370756b750a5563dacade10898607bee0858ae6d21b3d02b5cdbb10629"
    end
  end

  def install
    bin.install "jp-pii-detect"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/jp-pii-detect version")
  end
end
