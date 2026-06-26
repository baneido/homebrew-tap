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
  version "0.3.3"

  on_macos do
    on_arm do
      url "https://github.com/baneido/jp-pii-detector/releases/download/v0.3.3/jp-pii-detect_darwin_arm64.tar.gz"
      sha256 "789324acc74cbfa159a09ddf8bee62d1beb6f6bee86ba321bb05de43beb2526a"
    end
    on_intel do
      url "https://github.com/baneido/jp-pii-detector/releases/download/v0.3.3/jp-pii-detect_darwin_amd64.tar.gz"
      sha256 "2b377666bfffb9b2761871f132ebabd4d08215b68464a8815d885fbf43c2ef4f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/baneido/jp-pii-detector/releases/download/v0.3.3/jp-pii-detect_linux_arm64.tar.gz"
      sha256 "e23ce9e90bf4b6678b126421213820327ca1d13afdf34b809a53583fb60f49e3"
    end
    on_intel do
      url "https://github.com/baneido/jp-pii-detector/releases/download/v0.3.3/jp-pii-detect_linux_amd64.tar.gz"
      sha256 "d25da686c65ed6cccd1846a7867129d8128c7bdfad2f70e4c1a7147c8874e350"
    end
  end

  def install
    bin.install "jp-pii-detect"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/jp-pii-detect version")
  end
end
