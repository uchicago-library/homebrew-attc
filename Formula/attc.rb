class Attc < Formula
  desc "Tool for batch-converting attachments to preservation formats"
  homepage "https://github.com/uchicago-library/attachment-converter"
  url "https://dldc.lib.uchicago.edu/open/dist/attc/attc-macos_0.2.10-4.tar.gz"
  sha256 "1ede583a446a4f42b14edda7bb63c81a68b0858b82210fd0427bc4ed78d94786"
  license "GPL-3.0-or-later"

  depends_on "opam" => :build
  depends_on "ghostscript"
  depends_on "mercurial"
  depends_on "pandoc"
  depends_on "verapdf"
  depends_on "vips"
  depends_on "poppler"

  def install
    ENV.deparallelize
    bin.install "attc"
    # system "env", "OPAMSOLVERTIMEOUT=0", "make", "pkg-build", "gen-man-page"
    # bin.install "_build/default/main.exe" => "attc"
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
