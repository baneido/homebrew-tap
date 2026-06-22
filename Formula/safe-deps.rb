# Template for the Homebrew formula published to baneido/homebrew-tap.
# The release workflow's `homebrew` job (.github/workflows/release.yml) fills the
# version, tag, and per-target SHA-256 placeholders per release and opens a PR on
# baneido/homebrew-tap. Do not edit the generated Formula/safe-deps.rb by hand.
#
# This formula downloads the prebuilt, checksummed binaries from GitHub Releases
# instead of building from source, so `brew install` needs no Rust toolchain.
class SafeDeps < Formula
  desc "Static linter for package-management security practices"
  homepage "https://github.com/baneido/safe-deps"
  version "0.2.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/baneido/safe-deps/releases/download/v0.2.2/safe-deps-aarch64-apple-darwin.tar.gz"
      sha256 "433b78863d81150ae583e34d337813d32c68c3baa8077ee7e87a05197eea052c"
    end
    on_intel do
      url "https://github.com/baneido/safe-deps/releases/download/v0.2.2/safe-deps-x86_64-apple-darwin.tar.gz"
      sha256 "86e975e07a3154401ba5b2e74f68556f354189a34deff1948508426a266666c0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/baneido/safe-deps/releases/download/v0.2.2/safe-deps-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e779c102c7cc3156e67d46e357cf6184e30c08751b0db02976a105b91f8d1dfc"
    end
    on_intel do
      url "https://github.com/baneido/safe-deps/releases/download/v0.2.2/safe-deps-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a3a70bab008a7c0b349c119002c703e5082805d0b6ff351b783ef8a8954d10cb"
    end
  end

  def install
    bin.install "safe-deps"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/safe-deps --version")
  end
end
