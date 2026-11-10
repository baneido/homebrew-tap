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
      url "https://github.com/baneido/jp-pii-detector/releases/download/v0.9.3/jp-pii-detect_darwin_arm64.tar.gz"
      sha256 "f60ce2fcab8d34675418015b72e8cf0f66c4084e32503ed2b36db0f15c8abe22"
    end
    on_intel do
      url "https://github.com/baneido/jp-pii-detector/releases/download/v0.9.3/jp-pii-detect_darwin_amd64.tar.gz"
      sha256 "aa0153392c60c9b55fcfa8039341cc8ceb7bc77eb7a1edf80a4d05dedd521854"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/baneido/jp-pii-detector/releases/download/v0.9.3/jp-pii-detect_linux_arm64.tar.gz"
      sha256 "57d552ae0ba434678b8ccf8c047bb2803c9317c11725408becc5d473873a22c6"
    end
    on_intel do
      url "https://github.com/baneido/jp-pii-detector/releases/download/v0.9.3/jp-pii-detect_linux_amd64.tar.gz"
      sha256 "46e67d75fc57b1301a768ed5c1336c1ee2fe0db620a4acdb88e43ee8210275e7"
    end
  end

  def install
    bin.install "jp-pii-detect"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/jp-pii-detect version")
  end
end
