cask "displayhelp" do
  version "0.6.9"
  sha256 "0e643705aabc6d898f035669d76b436a5f9e3c75c8ec44da3bf0c82db5db1d2b"

  url "https://github.com/hov172/DisplayHelp/releases/download/v#{version}/DisplayHelp-#{version}.pkg"
  name "DisplayHelp"
  desc "Menu bar app that makes projectors, TVs and external displays behave"
  homepage "https://github.com/hov172/DisplayHelp"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  pkg "DisplayHelp-#{version}.pkg"

  uninstall launchctl: [
              "com.displayhelp.app",
              "com.displayhelp.updater",
            ],
            quit:      "com.displayhelp.app",
            pkgutil:   "com.displayhelp.app",
            delete:    "/Library/LaunchAgents/com.displayhelp.app.plist"

  zap trash: [
    "~/Library/Application Support/DisplayHelp",
    "~/Library/Preferences/com.displayhelp.app.plist",
  ]
end
