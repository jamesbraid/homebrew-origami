# Homebrew tap for Origami

[Origami](https://origami.irix.fans/) is an emulator for SGI MIPS workstations and servers, built on QEMU. This tap installs it on macOS (Intel and Apple silicon, macOS 14 or later).

The desktop app:

```sh
brew install --cask jamesbraid/origami/origami
```

The command-line tool, with the bundled QEMU:

```sh
brew install jamesbraid/origami/origami-cli
```

Update with `brew upgrade`. Remove the app with `brew uninstall --cask origami`, or `brew uninstall --zap --cask origami` to delete its preferences and caches too. Your machines and disks in `~/Library/Application Support/Origami` are never touched.

The packages are the signed release builds from [jamesbraid/origami](https://github.com/jamesbraid/origami/releases). Bugs in Origami belong there. This repository only holds the install recipes, and a release updates them automatically.

BSD 3-Clause, the same as Origami.
