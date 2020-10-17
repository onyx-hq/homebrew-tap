class Whale < Formula
  desc "Data warehouse command line explorer"
  homepage "https://github.com/rsyi/whale"
  url "https://github.com/dataframehq/whale/releases/download/v1.0.0/whale-mac.tar.gz"
  sha256 "5c8c5cca1046c94ad18c38919bed6e383a23e85a2d69593f567ccbc31adfc5c5"
  version "v1.0.0"

  depends_on "python"
  depends_on "rust" => :build

  def install
    system "make build_dir=./libexec"
    system "cp cli/target/release/whale cli/target/release/wh"
    bin.install "cli/target/release/wh"
    prefix.install Dir["libexec"]
  end
end
