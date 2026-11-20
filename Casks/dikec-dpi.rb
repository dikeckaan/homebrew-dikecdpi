cask "dikec-dpi" do
  version "1.1.1"
  sha256 "839e0bd9480f1a339c9434ed65d7994cf62e4f45afced72e649e9cbe5d2a3d0f"

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
