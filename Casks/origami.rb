cask "origami" do
  version "0.6.1"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"

  url "https://github.com/jamesbraid/origami/releases/download/v#{version}/origami-#{version}-macos-universal.zip",
      verified: "github.com/jamesbraid/origami/"
  name "Origami"
  desc "Emulator for SGI MIPS workstations and servers, built on QEMU"
  homepage "https://origami.irix.fans/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "Origami.app"

  # Leaves ~/Library/Application Support/Origami alone: it holds users' machines and disks.
  zap trash: [
    "~/Library/Caches/fans.irix.origami",
    "~/Library/Preferences/fans.irix.origami.plist",
    "~/Library/Saved Application State/fans.irix.origami.savedState",
  ]
end
