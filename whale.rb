class Whale < Formula
  include Language::Python::Virtualenv

  desc "Data warehouse command line explorer"
  homepage "https://github.com/rsyi/whale"
  url "https://github.com/dataframehq/whale/releases/download/v1.0.0/whale-mac.tar.gz"
  sha256 "82e7b3d273830c1858c36fa242d2da0c367bb330865d2b5c88c80ed2b441c4a1"
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
