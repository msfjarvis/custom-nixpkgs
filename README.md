# custom-nixpkgs [![Build nix packages](https://github.com/msfjarvis/custom-nixpkgs/actions/workflows/build.yml/badge.svg)](https://github.com/msfjarvis/custom-nixpkgs/actions/workflows/build.yml)

Custom NixOS packages for personal use. They're maintained on a best-effort basis and checked by CI on each push.

Included packages:

- [adb-sync] : Fork of [Google's adb-sync] with bugfixes for busybox users and the pull times feature
- [adx] : Rust tool to poll Google Maven for AndroidX packages and their latest versions
- [bundletool] : Command-line tool to manipulate Android App Bundles
- [clipboard-substitutor] : Rust CLI to listen to clipboard events and perform operations on the copied text
- [diffuse] : Java tool to diff between APKs, AARs and JARs
- [file-collector] : Simple CLI tool to watch directories and move their files to a single dumping ground
- [gdrive] : Golang CLI to interact with Google Drive
- [hcctl]: CLI to look up the status of checks on https://healthchecks.io
- [healthchecks-monitor]: CLI tool to run commands and report its result to https://healthchecks.io
- [hyperlink]: Very fast link checker for CI
- [katbin] : A CLI for [katb.in]
- [linkleaner] : Telegram bot to fix social media link previews
- [pidcat] : Fork of [JakeWharton's pidcat] with Python3 support and some other fixes
- [topgrade] : The original [topgrade] package from before it was forked by the community and started dwindling in quality
- [twt] : Multipurpose tool to extract metadata from a user's tweets
- [when] : A CLI tool to deal with timezones 

[adb-sync]: https://msfjarvis.dev/g/adb-sync
[Google's adb-sync]: https://github.com/google/adb-sync
[adx]: https://msfjarvis.dev/g/androidx-release-watcher
[bundletool]: https://developer.android.com/studio/command-line/bundletool
[clipboard-substitutor]: https://msfjarvis.dev/g/clipboard-substitutor
[diffuse]: https://github.com/JakeWharton/diffuse
[file-collector]: https://msfjarvis.dev/g/file-collector
[gdrive]: https://msfjarvis.dev/g/gdrive
[hcctl]: https://msfjarvis.dev/g/healthchecks-rs
[healthchecks-monitor]: https://msfjarvis.dev/g/healthchecks-rs
[hyperlink]: https://github.com/untitaker/hyperlink
[jetbrains-mono-nerdfonts]: https://github.com/ryanoasis/nerd-fonts
[katbin]: https://github.com/SphericalKat/katbin-cli
[katb.in]: https://katb.in
[linkleaner]: https://msfjarvis.dev/g/linkleaner
[pidcat]: https://msfjarvis.dev/g/pidcat
[JakeWharton's pidcat]: https://github.com/JakeWharton/pidcat
[topgrade]: https://github.com/r-darwish/topgrade
[twt]: https://msfjarvis.dev/g/twt
[when]: https://github.com/mitsuhiko/when
