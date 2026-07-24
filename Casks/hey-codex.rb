cask "hey-codex" do
  version "0.1.0"
  sha256 "bbd380b46591a9d1d632c78d86a6f8e0dfc0a717767413b6a50a91133ffce67d"

  url "https://github.com/cyburke/hey-codex/releases/download/v#{version}/HeyCodex-#{version}.zip"
  name "Hey Codex"
  desc "Menu-bar wake word that opens ChatGPT Voice"
  homepage "https://github.com/cyburke/hey-codex"

  depends_on macos: ">= :sonoma"

  app "HeyCodex.app"

  caveats <<~EOS
    Hey Codex is not notarized, so it must be installed with --no-quarantine:

      brew install --cask --no-quarantine cyburke/tap/hey-codex

    On first launch, grant Microphone and Accessibility permission when asked.
    Accessibility is what lets Hey Codex press the ChatGPT Voice hotkey.
  EOS

  uninstall quit: "com.heycodex.app"

  zap trash: [
    "~/Library/Application Support/HeyCodex",
    "~/Library/Preferences/com.heycodex.app.plist",
  ]
end
