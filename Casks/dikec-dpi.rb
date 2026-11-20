cask "dikec-dpi" do
  version "1.3.1"
  sha256 "267b63b41558c9a479179e762b40f650946028cb23eae0f87f57d23a40ff48dc"

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
