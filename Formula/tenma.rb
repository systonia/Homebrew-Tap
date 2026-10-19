class Tenma < Formula
  desc "PHP as a long-running process: the script runs once, then one event loop serves every request"
  homepage "https://tenma.dev"
  url "https://github.com/systonia/Tenma/releases/download/v0.1.21/tenma-macos-arm64.tar.gz"
  version "0.1.21"
  sha256 "fb80f63aed6d63286d1cee1a003cc837b6238b1d7530d2634734739b79eb7471"
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
