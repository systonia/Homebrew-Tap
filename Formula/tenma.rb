class Tenma < Formula
  desc "PHP as a long-running process: the script runs once, then one event loop serves every request"
  homepage "https://tenma.dev"
  url "https://github.com/systonia/Tenma/releases/download/v0.1.16/tenma-macos-arm64.tar.gz"
  version "0.1.16"
  sha256 "32a86ac4322629a6e4950b5f05791b337a4936f492f6c30c825310e1189f82a6"
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
