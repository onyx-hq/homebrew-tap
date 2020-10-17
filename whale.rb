class Whale < Formula
  include Language::Python::Virtualenv

  desc "Data warehouse command line explorer"
  homepage "https://github.com/rsyi/whale"
  url "https://github.com/dataframehq/whale/releases/download/v1.0.0/whale-mac.tar.gz"
  sha256 "24f9bcb7b18c5b708ef81d3976f2a646c75888dfb95b71a4c188d1765ecb48f6"
  version "v1.0.0"

  depends_on "python@3.8"
  depends_on "rust" => :build

  def install
    system "make rust"
    venv = virtualenv_create(libexec/"env", python="python3")
    system libexec/"env/bin/pip", "install", "-v", "-r", buildpath/"databuilder/requirements.txt",
      "--ignore-installed", buildpath/"databuilder"
    system "cp cli/target/release/whale cli/target/release/wh"
    bin.install "cli/target/release/wh"
    libexec.install buildpath/"databuilder/build_script.py"
    libexec.install buildpath/"databuilder/run_script.py"
  end
end
