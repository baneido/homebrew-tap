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
  version "0.4.0"

  on_macos do
    on_arm do
      url "https://github.com/baneido/jp-pii-detector/releases/download/v0.4.0/jp-pii-detect_darwin_arm64.tar.gz"
      sha256 "f7e819f817d78bd436d0e0c9e02307ac67005be7d64d0009b3758de78d4a1796"
    end
    on_intel do
      url "https://github.com/baneido/jp-pii-detector/releases/download/v0.4.0/jp-pii-detect_darwin_amd64.tar.gz"
      sha256 "44dc8525b793389a547fd6c9d11988c475eb7fb8b00333392c17b9e3e0823342"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/baneido/jp-pii-detector/releases/download/v0.4.0/jp-pii-detect_linux_arm64.tar.gz"
      sha256 "e5049a648bb3cf7e54fbcd2f38acc0f61a7cd80450a0f30b3817d626529478f1"
    end
    on_intel do
      url "https://github.com/baneido/jp-pii-detector/releases/download/v0.4.0/jp-pii-detect_linux_amd64.tar.gz"
      sha256 "6ad88a4c32371c0ea2bc5be66118cf14e4b0ddbcbadc2a1f2ebefddfb70d97ed"
    end
  end

  def install
    bin.install "jp-pii-detect"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/jp-pii-detect version")
  end
end
