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
  version "0.4.3"

  on_macos do
    on_arm do
      url "https://github.com/baneido/jp-pii-detector/releases/download/v0.4.3/jp-pii-detect_darwin_arm64.tar.gz"
      sha256 "9ec841cf3ed525f63fe76e88c437c4ac1878b8768cc79053e428aee9331da7a7"
    end
    on_intel do
      url "https://github.com/baneido/jp-pii-detector/releases/download/v0.4.3/jp-pii-detect_darwin_amd64.tar.gz"
      sha256 "8a57fa6b1a390e2a6591111d2df07336115c7bf973900cd916b07a2afd70f546"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/baneido/jp-pii-detector/releases/download/v0.4.3/jp-pii-detect_linux_arm64.tar.gz"
      sha256 "fd1458d43c5d2991143f26b883c3f1af3ad98f3542b91a8b3f4c31f0dc941848"
    end
    on_intel do
      url "https://github.com/baneido/jp-pii-detector/releases/download/v0.4.3/jp-pii-detect_linux_amd64.tar.gz"
      sha256 "a95491dcbaf9bd261f15c4713bcfa3c9a18dc92bd21d3bed9b6568b200da088f"
    end
  end

  def install
    bin.install "jp-pii-detect"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/jp-pii-detect version")
  end
end
