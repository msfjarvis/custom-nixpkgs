# custom-nixpkgs [![Check nix packages](https://github.com/msfjarvis/custom-nixpkgs/workflows/Check%20nix%20packages/badge.svg?branch=develop)](https://github.com/msfjarvis/custom-nixpkgs/actions?query=workflow%3A%22Check+nix+packages%22)

Custom NixOS packages for personal use. They're maintained on a best-effort basis and checked by CI on each push.

Included packages:

- [adb-sync] : Fork of [Google's adb-sync] with bugfixes for busybox users and the pull times feature
- [adx] : Rust tool to poll Google Maven for AndroidX packages and their latest versions
- [bundletool] : Command-line tool to manipulate Android App Bundles
- [diffuse] : Java tool to diff between APKs, AARs and JARs
- [gdrive] : Golang CLI to interact with Google Drive
- [git-quickfix] : Small Git add-on to commit changes to a new branch without leaving the current one
- [hcctl]: CLI to look up the status of checks on https://healthchecks.io
- [healthchecks-monitor]: CLI tool to run commands and report its result to https://healthchecks.io
- [jetbrains-mono-nerdfonts] : Packaging of the [nerd-fonts] variant of [JetBrains' JetBrains Mono] typeface
- [natls]: `ls` alternative with useful info and a splash of color art
- [pidcat] : Fork of [JakeWharton's pidcat] with Python3 support and some other fixes

[adb-sync]: https://msfjarvis.dev/g/adb-sync
[Google's adb-sync]: https://github.com/google/adb-sync
[adx]: https://msfjarvis.dev/g/androidx-release-watcher
[bundletool]: https://developer.android.com/studio/command-line/bundletool
[diffuse]: https://github.com/JakeWharton/diffuse
[fclones]: https://github.com/pkolaczk/fclones
[gdrive]: https://msfjarvis.dev/g/gdrive
[git-quickfix]: https://github.com/siedentop/git-quickfix
[jetbrains-mono-nerdfonts]: https://github.com/ryanoasis/nerd-fonts
[nerd-fonts]: https://github.com/ryanoasis/nerd-fonts
[Jetbrains' JetBrains Mono]: https://github.com/JetBrains/JetBrainsMono
[natls]: https://github.com/willdoescode/nat
[pidcat]: https://msfjarvis.dev/g/pidcat
[JakeWharton's pidcat]: https://github.com/JakeWharton/pidcat
[hcctl]: https://msfjarvis.dev/g/healthchecks-rs
[healthchecks-monitor]: https://msfjarvis.dev/g/healthchecks-rs
