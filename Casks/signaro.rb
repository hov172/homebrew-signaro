cask "signaro" do
  version "5.5-1.7.26"
  sha256 "4f336721bd9b3fa51ad852283d54850b55f3dc7b1350c1775efb1582298336d0"

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
