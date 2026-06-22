# Baneido Homebrew Tap

Homebrew formulae for [Baneido](https://github.com/baneido) tools.

## jp-pii-detect

日本特化の個人情報（PII）静的検出器。

```sh
brew install baneido/tap/jp-pii-detect
```

The `Formula/jp-pii-detect.rb` formula is updated automatically by the
[jp-pii-detect release workflow](https://github.com/baneido/jp-pii-detector/blob/main/.github/workflows/release.yml).

## shipsafe

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

## safe-deps

Static linter for package-management security practices (reproducibility,
integrity, registry/TLS safety, supply-chain hardening).

```sh
brew install baneido/tap/safe-deps
```

Installs the prebuilt release binary — no Rust toolchain required. The
`Formula/safe-deps.rb` formula is updated automatically by the
[safe-deps release workflow](https://github.com/baneido/safe-deps/blob/main/.github/workflows/release.yml).
