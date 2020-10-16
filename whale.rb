class Whale < Formula
  desc "Data warehouse command line explorer"
  homepage "https://github.com/rsyi/whale"
  url "https://github.com/dataframehq/whale/releases/download/v1.0.0b0/whale-mac.tar.gz"
  sha256 "2a609954eb5bfbc8de8b080959fe8cdd75158058eb3c006eca7be5e7bcc834dd"
  version "v1.0.0b0"

  depends_on "python"
  depends_on "rust" => :build

  def install
    system "make build_dir=./libexec"
    system "cp cli/target/release/whale cli/target/release/wh"
    bin.install "cli/target/release/wh"
    prefix.install Dir["libexec"]
  end
end
