class Whale < Formula
  include Language::Python::Virtualenv

  desc "Data warehouse command line explorer"
  homepage "https://github.com/rsyi/whale"
  url "https://github.com/dataframehq/whale/releases/download/v1.1.0/whale-mac.tar.gz"
  sha256 "ff06f0f289137d7d97844b11c29c06c3e3aa27a6a20cbe959ebb9ab822d2dd8b"
  version "v1.1.0"

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
