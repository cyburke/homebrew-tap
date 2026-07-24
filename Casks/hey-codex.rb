cask "hey-codex" do
  version "0.1.0"
  sha256 "bbd380b46591a9d1d632c78d86a6f8e0dfc0a717767413b6a50a91133ffce67d"

  url "https://github.com/cyburke/hey-codex/releases/download/v#{version}/HeyCodex-#{version}.zip"
  name "Hey Codex"
  desc "Menu-bar wake word that opens ChatGPT Voice"
  homepage "https://github.com/cyburke/hey-codex"

  depends_on macos: :sonoma

  app "HeyCodex.app"

  # Hey Codex is signed but not notarized, so macOS quarantines the download and
  # blocks the first launch behind System Settings. Homebrew's own
  # --no-quarantine option was removed in Homebrew 6, so clear the attribute
  # here instead. Installing from this tap is the user opting in to that.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/HeyCodex.app"],
                   sudo: false
  end

  caveats <<~EOS
    Launch Hey Codex, then grant Microphone and Accessibility when asked.
    Accessibility is what lets it press the ChatGPT Voice hotkey.
  EOS

  uninstall quit: "com.heycodex.app"

  zap trash: [
    "~/Library/Application Support/HeyCodex",
    "~/Library/Preferences/com.heycodex.app.plist",
  ]
end
