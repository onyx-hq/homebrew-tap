class Whale < Formula
  desc "Data warehouse command line explorer"
  homepage "https://github.com/rsyi/whale"
  url "https://github.com/rsyi/whale/releases/download/v0.0.0b7/whale-mac.tar.gz"
  sha256 "374688e219374e765648c032d1bc336b6c470b00c27e95630df6af46cac77ebe"
  version "v0.0.0b7"

  depends_on "python"
  depends_on "rust"

  def install
    system "make build_dir=./libexec"
    system "cp cli/target/release/whale cli/target/release/wh"
    bin.install "cli/target/release/wh"
    prefix.install Dir["libexec"]
  end
end
