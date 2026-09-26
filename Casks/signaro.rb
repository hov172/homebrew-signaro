cask "signaro" do
  version "5.5-1.7.21"
  sha256 "d445e37172ec5b62b6a8db27fccf25337807f8c5074ecb4421e6d882ea8b0e52"

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
