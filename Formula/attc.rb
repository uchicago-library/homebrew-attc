class Attc < Formula
  desc "Tool for batch-converting attachments to preservation formats"
  homepage "https://github.com/uchicago-library/attachment-converter"
  url "https://dldc.lib.uchicago.edu/open/dist/attc/attc-macos_0.2.10-4.tar.gz"
  sha256 "e815ee865f642f8103f75788ba82b3f1642479a9bfc3a9c0c6f3b531f68a4503"
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
