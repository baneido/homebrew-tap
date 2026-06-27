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
  version "0.3.4"

  on_macos do
    on_arm do
      url "https://github.com/baneido/jp-pii-detector/releases/download/v0.3.4/jp-pii-detect_darwin_arm64.tar.gz"
      sha256 "3debee6dd0398b33f0894fe7a7023d23e068b9d98ae47b306985c466aed79caf"
    end
    on_intel do
      url "https://github.com/baneido/jp-pii-detector/releases/download/v0.3.4/jp-pii-detect_darwin_amd64.tar.gz"
      sha256 "18a8939361096260c135661bf12f22004beaca4ed1e28be7ccaecd401a2e8535"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/baneido/jp-pii-detector/releases/download/v0.3.4/jp-pii-detect_linux_arm64.tar.gz"
      sha256 "24fef3e027e7cba575adc337ef25243d926b6448c1b7d1f9d36b98ab9bfdf4cc"
    end
    on_intel do
      url "https://github.com/baneido/jp-pii-detector/releases/download/v0.3.4/jp-pii-detect_linux_amd64.tar.gz"
      sha256 "4804964af28859828679015994addf3743f7e91fa31b8cf44a8d7aebd8cc6999"
    end
  end

  def install
    bin.install "jp-pii-detect"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/jp-pii-detect version")
  end
end
