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
      url "https://github.com/baneido/jp-pii-detector/releases/download/v0.8.2/jp-pii-detect_darwin_arm64.tar.gz"
      sha256 "1c398d0c6dbbd6624e58486827cc9c6486aff580c2220b879f5a1e7fa38c765b"
    end
    on_intel do
      url "https://github.com/baneido/jp-pii-detector/releases/download/v0.8.2/jp-pii-detect_darwin_amd64.tar.gz"
      sha256 "796562dc7a7d829c06d1cf8a7c2a037bb9046c21d0660c3b7a9682fc9d387a04"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/baneido/jp-pii-detector/releases/download/v0.8.2/jp-pii-detect_linux_arm64.tar.gz"
      sha256 "6ee40da6af3b60da68d16ac08f183c3b8d4e70cfc0d2a6fdc6d892c6d1355c24"
    end
    on_intel do
      url "https://github.com/baneido/jp-pii-detector/releases/download/v0.8.2/jp-pii-detect_linux_amd64.tar.gz"
      sha256 "65afccc245bc4be71c0e5879d0c87fdeb362f6e2472850d3fee0a6ba5b81b43f"
    end
  end

  def install
    bin.install "jp-pii-detect"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/jp-pii-detect version")
  end
end
