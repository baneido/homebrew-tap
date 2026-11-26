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
      url "https://github.com/baneido/jp-pii-detector/releases/download/v0.10.0/jp-pii-detect_darwin_arm64.tar.gz"
      sha256 "988c9b32255655a4952b6525d37d358cfb80e6a9a7041ad4a8a7d9ce2b0bddba"
    end
    on_intel do
      url "https://github.com/baneido/jp-pii-detector/releases/download/v0.10.0/jp-pii-detect_darwin_amd64.tar.gz"
      sha256 "07052b0a1539df61b7af35ec9fbe3849afa67e4a51d85c00ba29e0e0a23789eb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/baneido/jp-pii-detector/releases/download/v0.10.0/jp-pii-detect_linux_arm64.tar.gz"
      sha256 "74c63b0ec6321219077d4ebe5a9de42745d6793bce066545c92214c8e2e4f24b"
    end
    on_intel do
      url "https://github.com/baneido/jp-pii-detector/releases/download/v0.10.0/jp-pii-detect_linux_amd64.tar.gz"
      sha256 "bb81bf00d6705342665fc35fe1fdf96acc2919434b90e483796772f767983cfa"
    end
  end

  def install
    bin.install "jp-pii-detect"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/jp-pii-detect version")
  end
end
