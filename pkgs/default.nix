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
  clipboard-substitutor = callPackage ./clipboard-substitutor {};
  diffuse-bin = callPackage ./diffuse-bin {};
  gdrive = callPackage ./gdrive {};
  gitice = callPackage ./gitice {
    inherit (fenix) fromManifestFile;
    inherit rust-manifest;
  };
  gphotos-cdp = callPackage ./gphotos-cdp {};
  hcctl = callPackage ./hcctl {};
  healthchecks-monitor = callPackage ./healthchecks-monitor {};
  katbin = callPackage ./katbin {};
  linkleaner = callPackage ./linkleaner {
    inherit (fenix) fromManifestFile;
    inherit rust-manifest;
  };
  monocraft-nerdfonts = callPackage ./monocraft-nerdfonts {};
  patreon-dl = callPackage ./patreon-dl {};
  pidcat = callPackage ./pidcat {};
  rucksack = callPackage ./rucksack {};
  tea-dev = callPackage ./tea-dev {};
  twt = lib.warn "twt is no longer maintained" callPackage ./twt {};
  when = callPackage ./when {};
}
