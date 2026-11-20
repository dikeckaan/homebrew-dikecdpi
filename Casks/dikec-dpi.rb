cask "dikec-dpi" do
  version "1.3.0"
  sha256 "7b319107181ba5b5f5d3e5f10e4f41a8131b49c65e53b381840c41be8537ceee"

  url "https://github.com/dikeckaan/DikecDPI/releases/download/v#{version}/DikecDPI-#{version}-macos-universal.zip"
  name "Dikec DPI"
  desc "DPI engellerini aşan, kendi kendini ayarlayan proxy uygulaması"
  homepage "https://github.com/dikeckaan/DikecDPI"

  depends_on macos: :ventura

  app "Dikec DPI.app"

  uninstall quit: "com.dikec.dpi"

  caveats <<~EOS
    Dikec DPI henüz Apple tarafından onaylanmadı (notarize edilmedi).
    İlk açılışta macOS uyarı verirse:
      Sistem Ayarları → Gizlilik ve Güvenlik → "Yine de Aç"
    Bu yalnızca bir kez gerekir.
  EOS

  zap trash: [
    "~/Library/Application Support/DikecDPI",
    "~/Library/Preferences/com.dikec.dpi.plist",
  ]
end
