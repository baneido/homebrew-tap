# Template for the Homebrew formula published to baneido/homebrew-tap.
# Placeholders (0.2.0, https://github.com/baneido/shipsafe/archive/refs/tags/v0.2.0.tar.gz, 89e1a3da10ad0e2dd45be3cb52ed4a90957610a54f18c665efe2ccc55b762fc5) are filled by the release
# workflow's homebrew job.
class Shipsafe < Formula
  desc "AI-Powered Pre-Deploy Security Gate - SAST, SCA, and secrets scanning"
  homepage "https://github.com/baneido/shipsafe"
  url "https://github.com/baneido/shipsafe/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "89e1a3da10ad0e2dd45be3cb52ed4a90957610a54f18c665efe2ccc55b762fc5"
  version "0.2.0"
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
