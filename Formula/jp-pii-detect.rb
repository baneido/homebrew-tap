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
  version "0.1.8"

  on_macos do
    on_arm do
      url "https://github.com/baneido/jp-pii-detector/releases/download/v0.1.8/jp-pii-detect_darwin_arm64.tar.gz"
      sha256 "682e338adb8868f5bb202e3bc92692282d2bf09fbf53d6bf333f6bfbff705c84"
    end
    on_intel do
      url "https://github.com/baneido/jp-pii-detector/releases/download/v0.1.8/jp-pii-detect_darwin_amd64.tar.gz"
      sha256 "fd2d0ad637d8630858bd769d287687d0be86e55d2424b1109daa383c10d2f7f1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/baneido/jp-pii-detector/releases/download/v0.1.8/jp-pii-detect_linux_arm64.tar.gz"
      sha256 "011bef0fb7e8cd65832287563145d40343cd135209090d293366582e2fb2bbe2"
    end
    on_intel do
      url "https://github.com/baneido/jp-pii-detector/releases/download/v0.1.8/jp-pii-detect_linux_amd64.tar.gz"
      sha256 "647cc3c4720eca0afdc1415a653d5ed5b28b2c11a5abe925b5b5215cd234cc87"
    end
  end

  def install
    bin.install "jp-pii-detect"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/jp-pii-detect version")
  end
end
