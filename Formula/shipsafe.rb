# Template for the Homebrew formula published to baneido/homebrew-tap.
# Placeholders (0.2.2, https://github.com/baneido/shipsafe/archive/refs/tags/v0.2.2.tar.gz, 2bdf0faea0b36b0a751a502a3f9fe272ba643ee1b157a93c1f8706090373b567) are filled by the release
# workflow's homebrew job.
class Shipsafe < Formula
  desc "AI-Powered Pre-Deploy Security Gate - SAST, SCA, and secrets scanning"
  homepage "https://github.com/baneido/shipsafe"
  url "https://github.com/baneido/shipsafe/archive/refs/tags/v0.2.2.tar.gz"
  sha256 "2bdf0faea0b36b0a751a502a3f9fe272ba643ee1b157a93c1f8706090373b567"
  version "0.2.2"
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
