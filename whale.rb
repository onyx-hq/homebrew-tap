class Whale < Formula
  include Language::Python::Virtualenv

  desc "Data warehouse command line explorer"
  homepage "https://github.com/rsyi/whale"
  url "https://github.com/dataframehq/whale/releases/download/v1.0.0/whale-mac.tar.gz"
  sha256 "5c8c5cca1046c94ad18c38919bed6e383a23e85a2d69593f567ccbc31adfc5c5"
  version "v1.0.0b0"

  depends_on "python@3.8"
  depends_on "rust" => :build

  def install
    system "make rust"
    venv = virtualenv_create(libexec/"env", python="python3")
    venv.pip_install buildpath/"databuilder"
    system "cp cli/target/release/whale cli/target/release/wh"
    bin.install "cli/target/release/wh"
    libexec.install buildpath/"databuilder/build_script.py"
    libexec.install buildpath/"databuilder/run_script.py"
  end
end
