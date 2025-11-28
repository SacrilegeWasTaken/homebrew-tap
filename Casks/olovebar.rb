cask "olovebar" do
  version "1.1.0"
  sha256 :no_check

  url "https://github.com/SacrilegeWasTaken/olovebar/releases/download/#{version}/OLoveBar.dmg"
  name "OLoveBar"
  desc "Menu bar utility"
  homepage "https://github.com/SacrilegeWasTaken/olovebar"

  # Снимаем карантин после установки
  postflight do
    system "xattr -r -d com.apple.quarantine #{staged_path}/OLoveBar.app 2>/dev/null || true"
    system "xattr -r -d com.apple.quarantine #{appdir}/OLoveBar.app 2>/dev/null || true"
  end

  app "OLoveBar.app"

  uninstall quit: "com.sacrilege.olovebar"

  zap trash: [
    "~/Library/Preferences/com.sacrilege.olovebar.plist",
    "~/Library/Application Support/OLoveBar",
  ]
end
