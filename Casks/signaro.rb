cask "signaro" do
  version "5.5-1.7.20"
  sha256 "751b12e0b0805513b7bacf7bfa7c0eb6a52ce4be2652799478e15c4c9534a8cd"

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
