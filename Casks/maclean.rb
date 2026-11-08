cask "maclean" do
  version "0.4.0"
  sha256 "994fe9a0e3dbfadf7ff1aaec68f462351cd5f94af11bfbbc032c5302d1093c67"

  url "https://github.com/smalhasib/maclean/releases/download/v#{version}/Maclean-#{version}.zip"
  name "Maclean"
  desc "Disk space analyzer with a sunburst map, collector and Smart Clean"
  homepage "https://github.com/smalhasib/maclean"

  depends_on macos: :sonoma

  app "Maclean.app"
  binary "#{appdir}/Maclean.app/Contents/MacOS/maclean-scan"

  # Maclean is signed ad hoc, not with an Apple Developer ID, so Gatekeeper
  # would refuse to open the downloaded copy. Clear the quarantine flag on
  # the installed app only.
  postflight_steps do
    run "/usr/bin/xattr",
        args:           ["-dr", "com.apple.quarantine", "Maclean.app"],
        chdir:          "{{appdir}}",
        writable_paths: ["{{appdir}}/Maclean.app"]
  end

  zap trash: [
    "~/Library/Preferences/org.maclean.Maclean.plist",
    "~/Library/Saved Application State/org.maclean.Maclean.savedState",
  ]
end
