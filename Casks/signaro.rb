cask "signaro" do
  version "5.5-1.7.30"
  sha256 "625d32fe69c9c94c8b297d1b6c0d2051b6292dcf0afdf7f04762968638b72e51"

  url "https://github.com/hov172/Signaro/releases/download/v#{version.sub("-", "-build-")}/Signaro-#{version}.dmg"
  name "Signaro"
  desc "Code-signing, notarization, and iOS re-signing utility"
  homepage "https://github.com/hov172/Signaro"

  livecheck do
    url :url
    regex(/^v?(\d+(?:\.\d+)*)-build-(\d+(?:\.\d+)*)$/i)
    strategy :github_latest do |json, regex|
      match = json["tag_name"]&.match(regex)
      next if match.blank?

      "#{match[1]}-#{match[2]}"
    end
  end

  depends_on macos: :sonoma

  app "Signaro.app"
  binary "#{appdir}/Signaro.app/Contents/Helpers/SignaroCLI", target: "signarocli"

  zap trash: [
    "~/Library/Application Support/Signaro",
    "~/Library/Preferences/com.gmail.ayala.solutions.Signaro.plist",
  ]
end
