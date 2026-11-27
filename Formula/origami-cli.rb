class OrigamiCli < Formula
  desc "Command-line emulator for SGI MIPS workstations and servers, built on QEMU"
  homepage "https://origami.irix.fans/"
  url "https://github.com/jamesbraid/origami/releases/download/v0.7.0/origami-cli-0.7.0-macos-universal.tar.gz"
  sha256 "5051f61a95c75509bbb2a643f95c0545f6142b299007db15bddaaa7c68d428cb"
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
