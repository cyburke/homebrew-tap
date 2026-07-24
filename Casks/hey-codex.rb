cask "hey-codex" do
  version "0.1.0"
  sha256 "bbd380b46591a9d1d632c78d86a6f8e0dfc0a717767413b6a50a91133ffce67d"

  url "https://github.com/cyburke/hey-codex/releases/download/v#{version}/HeyCodex-#{version}.zip"
  name "Hey Codex"
  desc "Menu-bar wake word that opens ChatGPT Voice"
  homepage "https://github.com/cyburke/hey-codex"

  depends_on macos: :sonoma

  app "HeyCodex.app"

  caveats <<~EOS
    Hey Codex is signed but not notarized, so macOS blocks the first launch.

    Open it, click Done on the warning, then go to
    System Settings > Privacy & Security, scroll to Security, and click
    "Open Anyway" next to the Hey Codex message. That is a one time step.

    Then grant Microphone and Accessibility when asked. Accessibility is what
    lets Hey Codex press the ChatGPT Voice hotkey.
  EOS

  uninstall quit: "com.heycodex.app"

  zap trash: [
    "~/Library/Application Support/HeyCodex",
    "~/Library/Preferences/com.heycodex.app.plist",
  ]
end
