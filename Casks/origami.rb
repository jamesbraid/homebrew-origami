cask "origami" do
  version "0.6.1"
  sha256 "f48e7dd3184203959a2e0a7e7ea553bb3cba95a68b4d2a5abd387f98cdc16f51"

  url "https://github.com/jamesbraid/origami/releases/download/v#{version}/origami-#{version}-macos-universal.zip"
  name "Origami"
  desc "Emulator for SGI MIPS workstations and servers, built on QEMU"
  homepage "https://origami.irix.fans/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "Origami.app"

  # The old fans.irix.origami paths stay for upgraders on case-sensitive volumes.
  # Leaves ~/Library/Application Support/Origami alone: it holds users' machines and disks.
  zap trash: [
    "~/Library/Caches/fans.irix.Origami",
    "~/Library/Preferences/fans.irix.Origami.plist",
    "~/Library/Saved Application State/fans.irix.Origami.savedState",
    "~/Library/Caches/fans.irix.origami",
    "~/Library/Preferences/fans.irix.origami.plist",
    "~/Library/Saved Application State/fans.irix.origami.savedState",
  ]
end
