{
  pkgs,
  lib,
  fenix,
  rust-manifest,
}: let
  callPackage = pkg: pkgs.callPackage pkg;
in {
  adb-sync = callPackage ./adb-sync {};
  adbtuifm = callPackage ./adbtuifm {};
  adx = callPackage ./adx {};
  bundletool-bin = callPackage ./bundletool-bin {};
  cargo-dist-unstable = callPackage ./cargo-dist-unstable {};
  clipboard-substitutor = callPackage ./clipboard-substitutor {};
  diffuse-bin = callPackage ./diffuse-bin {};
  gdrive = callPackage ./gdrive {};
  gitice = callPackage ./gitice {
    inherit (fenix) fromManifestFile;
    inherit rust-manifest;
  };
  hcctl = callPackage ./hcctl {};
  healthchecks-monitor = callPackage ./healthchecks-monitor {};
  hyperlink = callPackage ./hyperlink {};
  katbin = callPackage ./katbin {};
  linkleaner = callPackage ./linkleaner {
    inherit (fenix) fromManifestFile;
    inherit rust-manifest;
  };
  monocraft-nerdfonts = callPackage ./monocraft-nerdfonts {};
  oranda = callPackage ./oranda {};
  patreon-dl = callPackage ./patreon-dl {};
  pidcat = callPackage ./pidcat {};
  rucksack = callPackage ./rucksack {};
  samply = callPackage ./samply {};
  tea-dev = callPackage ./tea-dev {};
  twt = lib.warn "twt is no longer maintained" callPackage ./twt {};
  when = callPackage ./when {};
}
