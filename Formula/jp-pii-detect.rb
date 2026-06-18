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
  version "0.2.1"

  on_macos do
    on_arm do
      url "https://github.com/baneido/jp-pii-detector/releases/download/v0.2.1/jp-pii-detect_darwin_arm64.tar.gz"
      sha256 "0b910ef56ee8934dbe3ad1e20f608a2531a2bf66c1466315b19409fee8c83d32"
    end
    on_intel do
      url "https://github.com/baneido/jp-pii-detector/releases/download/v0.2.1/jp-pii-detect_darwin_amd64.tar.gz"
      sha256 "d107a546c546db0bf3cee4eb4b83580131b50783a6e569d61546f1b956a43faa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/baneido/jp-pii-detector/releases/download/v0.2.1/jp-pii-detect_linux_arm64.tar.gz"
      sha256 "098ae3e49c2acc4c8be57303290744ec336f8636e40ba3172e07fd812251d2a0"
    end
    on_intel do
      url "https://github.com/baneido/jp-pii-detector/releases/download/v0.2.1/jp-pii-detect_linux_amd64.tar.gz"
      sha256 "97d732f7dc82abfa8e5fd05d7aef4c714316fc3f56b5352cea45ff1e0006227c"
    end
  end

  def install
    bin.install "jp-pii-detect"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/jp-pii-detect version")
  end
end
