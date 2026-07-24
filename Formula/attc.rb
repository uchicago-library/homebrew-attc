class Attc < Formula
  desc "Tool for batch-converting attachments to preservation formats"
  homepage "https://github.com/uchicago-library/attachment-converter"
  url "https://dldc.lib.uchicago.edu/open/dist/attc/attc-macos_0.2.11-2.tar.gz"
  sha256 "12df5611a38594792e31d4a80221f83423dedd3f8133882fe420342c9d53d4da"
  license "GPL-3.0-or-later"

  depends_on "ghostscript"
  depends_on "mercurial"
  depends_on "pandoc"
  depends_on "verapdf"
  depends_on "vips"
  depends_on "poppler"

  def install
    ENV.deparallelize
    bin.install "attc"
    libexec.install Dir["conversion-scripts/*"]
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
