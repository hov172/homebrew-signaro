cask "displayhelp" do
  version "0.6.10"
  sha256 "2f58f0e0a24173beb2d1a6d5b28bb7457b5a6fe2249f89978146130941293762"

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
