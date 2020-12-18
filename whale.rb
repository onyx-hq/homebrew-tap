class Whale < Formula
  include Language::Python::Virtualenv

  desc "Data warehouse command line explorer"
  homepage "https://github.com/rsyi/whale"
  url "https://github.com/dataframehq/whale/releases/download/v1.3.0/whale-mac.tar.gz"
  sha256 "e714dec3355da920c21fb92a13141b5e6ab9a4fce5f817c46f11e24566b7fcb0"
  version "v1.3.0"

  depends_on "python@3.8"
  depends_on "rust" => :build

  def install
    system "make rust"
    venv = virtualenv_create(libexec/"env", python="python3")
    system libexec/"env/bin/pip", "install", "-v", "-r", buildpath/"pipelines/requirements.txt",
      "--ignore-installed", buildpath/"pipelines"
    system "cp cli/target/release/whale cli/target/release/wh"
    bin.install "cli/target/release/wh"
    libexec.install buildpath/"pipelines/build_script.py"
    libexec.install buildpath/"pipelines/run_script.py"
  end
end
