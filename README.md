# homebrew-signaro

Homebrew tap for [Signaro](https://github.com/hov172/Signaro), a macOS code-signing, notarization, and iOS re-signing utility.

## Install

```sh
brew tap hov172/signaro
brew install --cask signaro
```

This installs `Signaro.app` into `/Applications` and exposes the bundled command-line tool as `signarocli`.

## Update

```sh
brew upgrade --cask signaro
```

## Uninstall

```sh
brew uninstall --cask signaro        # removes the app
brew uninstall --zap --cask signaro  # also removes preferences and Application Support data
```

Requires macOS 14 (Sonoma) or later. The DMG is signed with a Developer ID certificate and notarized by Apple, so no Gatekeeper workarounds are needed.

The cask is regenerated from the release pipeline on every Signaro release (`scripts/update-cask.sh` in the source repository).
