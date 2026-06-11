# Baneido Homebrew Tap

Homebrew formulae for [Baneido](https://github.com/baneido) tools.

## Usage

```sh
brew install baneido/tap/shipsafe
```

ShipSafe orchestrates external scanners — install them too:

```sh
brew install semgrep trivy gitleaks
shipsafe doctor
```

The `Formula/shipsafe.rb` formula is updated automatically by the
[shipsafe release workflow](https://github.com/baneido/shipsafe/blob/main/.github/workflows/release.yml).
