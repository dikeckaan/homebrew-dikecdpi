cask "dikec-dpi" do
  version "1.0.0"
  sha256 "6627413477b59acc17382534b6561ac37e2b83287a6f68d79b17902f627a8d3d"

  url "https://github.com/dikeckaan/DikecDPI/releases/download/v#{version}/DikecDPI-#{version}-macos-universal.zip"
  name "Dikec DPI"
  desc "DPI engellerini aşan, kendi kendini ayarlayan proxy uygulaması"
  homepage "https://github.com/dikeckaan/DikecDPI"

  depends_on macos: ">= :ventura"

  app "Dikec DPI.app"

  # The app is ad-hoc signed but not notarized; without this macOS refuses
  # to open it ("developer cannot be verified").
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Dikec DPI.app"]
  end

  uninstall quit: "com.dikec.dpi"

  zap trash: [
    "~/Library/Application Support/DikecDPI",
    "~/Library/Preferences/com.dikec.dpi.plist",
  ]
end
