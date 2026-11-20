class OrigamiCli < Formula
  desc "Command-line emulator for SGI MIPS workstations and servers, built on QEMU"
  homepage "https://origami.irix.fans/"
  url "https://github.com/jamesbraid/origami/releases/download/v0.6.1/origami-cli-0.6.1-macos-universal.tar.gz"
  sha256 "2bd1d0079f7feff0a0e5b95c7b406eb7fcf1708ce331b79e245ac6168b69e3ff"
  license all_of: ["BSD-3-Clause", "GPL-2.0-only"]

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  def install
    # The archive is a prefix: bin/, libexec/origami (QEMU) and share/origami.
    # origami finds QEMU relative to its own real path, so keep the tree
    # together and put exec scripts on the PATH.
    libexec.install Dir["*"]
    bin.write_exec_script libexec/"bin/origami"
    bin.write_exec_script libexec/"bin/instigator" if (libexec/"bin/instigator").exist?
  end

  test do
    assert_match "origami v#{version}", shell_output("#{bin}/origami --version")
  end
end
