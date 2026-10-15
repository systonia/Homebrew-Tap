class Tenma < Formula
  desc "PHP with Node's execution model: one process, one event loop"
  homepage "https://tenma.dev"
  url "https://github.com/systonia/Tenma/releases/download/v0.1.12/tenma-macos-arm64.tar.gz"
  version "0.1.12"
  sha256 "df9474e380bbfb51ebb58d2c86ca49c63c587fc3a66e885c9cc1a8bb42747087"
  license any_of: ["MIT", "Apache-2.0"]

  depends_on arch: :arm64
  depends_on "freetype"
  depends_on "gmp"
  depends_on "icu4c@78"
  depends_on "jpeg-turbo"
  depends_on "libpng"
  depends_on "libpq"
  depends_on "libsodium"
  depends_on "libzip"
  depends_on :macos
  depends_on "oniguruma"
  depends_on "openssl@3"
  depends_on "webp"

  def install
    bin.install "tenma"
    prefix.install "NOTICE", "LICENSE-MIT", "LICENSE-APACHE"
  end

  test do
    (testpath/"hello.php").write "<?php echo 'hello';"
    assert_equal "hello", shell_output("#{bin}/tenma #{testpath}/hello.php")
  end
end
