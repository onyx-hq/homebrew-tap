class Metaframe < Formula
  desc "A command line tool to run ETL jobs and view metadata"
  homepage "https://github.com/rsyi/metaframe"
  url "https://github.com/rsyi/metaframe/releases/download/v0.0.0a31/metaframe-mac.tar.gz"
  sha256 "cc2c2979814b55326c5055b99af69225fc3eaba1055364dc8aa6fe8843fb6067"
  version "v0.0.0a31"

  depends_on "golang"
  depends_on "python"

  def install
    system "make"
    bin.install "shell/mf"
    libexec.install Dir["dist"]
    libexec.install Dir["fzf/bin/fzf"]
  end
end

