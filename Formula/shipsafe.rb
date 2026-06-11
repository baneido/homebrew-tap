# Template for the Homebrew formula published to baneido/homebrew-tap.
# Placeholders (0.1.0, https://github.com/baneido/shipsafe/archive/refs/tags/v0.1.0.tar.gz, 35bf329d707d4bce87f81cb152d4c738cec4ccb53ad71efdd8b0f5c99d317f9c) are filled by the release
# workflow's homebrew job.
class Shipsafe < Formula
  desc "AI-Powered Pre-Deploy Security Gate - SAST, SCA, and secrets scanning"
  homepage "https://github.com/baneido/shipsafe"
  url "https://github.com/baneido/shipsafe/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "35bf329d707d4bce87f81cb152d4c738cec4ccb53ad71efdd8b0f5c99d317f9c"
  version "0.1.0"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  def caveats
    <<~EOS
      ShipSafe orchestrates external scanners. Install them with:
        brew install semgrep trivy gitleaks
      Verify with:
        shipsafe doctor
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/shipsafe version")
  end
end
