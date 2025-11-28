cask "olovebar" do
  # Update `version` and `sha256` when you publish a new release.
  version "1.1.0"

  # For initial testing you can use `sha256 :no_check`, but for production releases
  # calculate and pin the SHA256 of the DMG:
  # shasum -a 256 OLoveBar-1.1.0.dmg | awk '{print $1}'
  sha256 :no_check

  url "https://github.com/SacrilegeWasTaken/olovebar/releases/download/#{version}/OLoveBar.dmg"
  name "OLoveBar"
  desc "Menu bar utility"
  homepage "https://github.com/SacrilegeWasTaken/olovebar"

  postflight do
    system "xattr -d com.apple.quarantine #{staged_path}/OLoveBar.app 2>/dev/null || true"
    system "xattr -d com.apple.quarantine #{appdir}/OLoveBar.app 2>/dev/null || true"
  end

  app "OLoveBar.app", target: "#{appdir}"

  uninstall quit: "com.sacrilege.olovebar"

  zap trash: [
    "~/Library/Preferences/com.sacrilege.olovebar.plist",
    "~/Library/Application Support/OLoveBar",
  ]
end
