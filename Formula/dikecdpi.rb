class Dikecdpi < Formula
  desc "DPI engellerini aşan, kendi kendini ayarlayan proxy (SpoofDPI tabanlı)"
  homepage "https://github.com/dikeckaan/DikecDPI"
  url "https://github.com/dikeckaan/DikecDPI/archive/refs/tags/v1.3.5.tar.gz"
  sha256 "1aa4ad220cc380e26e14353d8d41b0e7cbdb92f8ac197551688edaac08357bde"
  license "Apache-2.0"
  head "https://github.com/dikeckaan/DikecDPI.git", branch: "main"

  depends_on "go" => :build

  def install
    # Linux builds are pure Go (as upstream); macOS links libpcap via cgo.
    ENV["CGO_ENABLED"] = "0" if OS.linux?
    ldflags = "-s -w -X main.version=#{version} -X main.build=homebrew"
    system "go", "build", *std_go_args(ldflags:, output: bin/"dikecdpi"), "./cmd/spoofdpi"
  end

  service do
    run [opt_bin/"dikecdpi", "--no-tui"]
    keep_alive true
    log_path var/"log/dikecdpi.log"
    error_log_path var/"log/dikecdpi.log"
  end

  def caveats
    <<~EOS
      Başlatmak için:
        dikecdpi
      Arka planda (oturum açılınca otomatik) çalıştırmak için:
        brew services start dikecdpi
      Masaüstü uygulaması için:
        brew install --cask dikec-dpi
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dikecdpi --version")
  end
end
