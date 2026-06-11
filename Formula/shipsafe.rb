# Updated automatically by the shipsafe release workflow on each tagged
# release (see baneido/shipsafe .github/workflows/release.yml).
class Shipsafe < Formula
  desc "AI-Powered Pre-Deploy Security Gate - SAST, SCA, and secrets scanning"
  homepage "https://github.com/baneido/shipsafe"
  url "https://github.com/baneido/shipsafe.git",
      branch: "main"
  version "0.1.0-dev"
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
    assert_match "shipsafe", shell_output("#{bin}/shipsafe version")
  end
end
