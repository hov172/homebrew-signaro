# homebrew-signaro

Homebrew tap for [Signaro](https://github.com/hov172/Signaro), a macOS code-signing, notarization, and iOS re-signing utility.

## Install

```sh
brew tap hov172/signaro
brew trust hov172/signaro   # Homebrew 5+ refuses third-party taps until you trust them
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

# DisplayHelp

The same tap also carries [DisplayHelp](https://github.com/hov172/DisplayHelp), a menu bar app that makes projectors, TVs and external displays behave.

## Install

```sh
brew tap hov172/signaro
brew trust hov172/signaro   # Homebrew 5+ refuses third-party taps until you trust them
brew install --cask displayhelp
```

Homebrew runs the signed and notarized installer package, so the result is identical to a manual install: `DisplayHelp.app` lands in `/Applications` and the global LaunchAgent starts it at login for every account. Expect an administrator password prompt.

## Update

```sh
brew upgrade --cask displayhelp
```

## Uninstall

```sh
brew uninstall --cask displayhelp        # quits the app, removes it and the login agent
brew uninstall --zap --cask displayhelp  # also removes saved profiles and preferences
```

Requires macOS 14 (Sonoma) or later. Managed Macs should keep deploying the package through their MDM; the cask is for people with a terminal.

The cask is rewritten on every DisplayHelp release by `scripts/update-cask.sh` in the source repository.
