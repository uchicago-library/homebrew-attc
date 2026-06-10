class Attc < Formula
  desc "Tool for batch-converting attachments to preservation formats"
  homepage "https://github.com/uchicago-library/attachment-converter"
  url "https://github.com/uchicago-library/attachment-converter/archive/refs/tags/v0.1.7.tar.gz"
  sha256 "262bfd77f51a8d45388701913f0acf2463820f5b66f8294d1dffc3a0a061821a"
  license "GPL-3.0-or-later"

  depends_on "opam" => :build
  depends_on "aspcud" => :build
  depends_on "ghostscript"
  depends_on "mercurial"
  depends_on "pandoc"
  depends_on "verapdf"
  depends_on "vips"

  def install
    ENV.deparallelize
    system "env", "OPAMSOLVERTIMEOUT=0", "make", "pkg-build", "SOLVER=builtin-0install"
    bin.install "_build/default/main.exe" => "attc"
    lib.install Dir["conversion-scripts/*"]
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
