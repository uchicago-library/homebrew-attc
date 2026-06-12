class Attc < Formula
  desc "Tool for batch-converting attachments to preservation formats"
  homepage "https://github.com/uchicago-library/attachment-converter"
  url "https://github.com/uchicago-library/attachment-converter/archive/refs/tags/v0.1.36.tar.gz"
  sha256 "9302291b530fd72f5460ca8c7f2c9e68645f9411c1b3301942293a4ac9e20890"
  license "GPL-3.0-or-later"

  depends_on "opam" => :build
  depends_on "ghostscript"
  depends_on "mercurial"
  depends_on "pandoc"
  depends_on "verapdf"
  depends_on "vips"

  def install
    ENV.deparallelize
    system "env", "OPAMSOLVERTIMEOUT=0", "make", "pkg-build", "gen-man-page"
    bin.install "_build/default/main.exe" => "attc"
    lib.install Dir["conversion-scripts/*"]
    man1.install "doc/attc.1"
  end

  def caveats
    <<~EOS
      Attachment Converter depends on LibreOffice for some functionality.

      Please install it using:
        brew install --cask libreoffice
    EOS
  end

  test do
    system "true"
  end
end
