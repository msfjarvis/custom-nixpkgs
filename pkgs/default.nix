{
  pkgs,
  fenix,
  rust-manifest,
}: let
  callPackage = pkg: pkgs.callPackage pkg;
in {
  adb-sync = callPackage ./adb-sync {};
  adbtuifm = callPackage ./adbtuifm {};
  adx = callPackage ./adx {};
  bundletool-bin = callPackage ./bundletool-bin {};
  clipboard-substitutor = callPackage ./clipboard-substitutor {};
  diffuse-bin = callPackage ./diffuse-bin {};
  file-collector = callPackage ./file-collector {};
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
  samply = callPackage ./samply {};
  twt = callPackage ./twt {};
  when = callPackage ./when {};
}
