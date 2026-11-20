cask "dikec-dpi" do
  version "1.3.1"
  sha256 "7b1bdbc5d6a7821944ea33c3ac548c464a7fe1b788d09cd7d5ce6d4f945cb5d4"

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
