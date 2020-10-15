class Whale < Formula
  desc "Data warehouse command line explorer"
  homepage "https://github.com/rsyi/whale"
  url "https://github.com/dataframehq/whale/releases/download/v1.0.0b0/whale-mac.tar.gz"
  sha256 "9037f14a29d03fca437a644ba1d7d71374bcd04cfe11d8be6138259594bbb285"
  version "v1.0.0b0"

  depends_on "python"
  depends_on "rust"

  def install
    system "make build_dir=./libexec"
    system "cp cli/target/release/whale cli/target/release/wh"
    bin.install "cli/target/release/wh"
    prefix.install Dir["libexec"]
  end
end
