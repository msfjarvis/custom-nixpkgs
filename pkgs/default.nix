{
  pkgs,
  fenix,
}: let
  callPackage = pkg: pkgs.callPackage pkg;
in {
  adb-sync = callPackage ./adb-sync {};
  adbtuifm = callPackage ./adbtuifm {};
  adx = callPackage ./adx {};
  bundletool-bin = callPackage ./bundletool-bin {};
  cargo-dist = callPackage ./cargo-dist {};
  clipboard-substitutor = callPackage ./clipboard-substitutor {};
  diffuse-bin = callPackage ./diffuse-bin {};
  file-collector = callPackage ./file-collector {};
  gdrive = callPackage ./gdrive {};
  hcctl = callPackage ./hcctl {};
  healthchecks-monitor = callPackage ./healthchecks-monitor {};
  hyperlink = callPackage ./hyperlink {};
  katbin = callPackage ./katbin {};
  linkleaner = callPackage ./linkleaner {inherit (fenix) fromToolchainFile;};
  monocraft-nerdfonts = callPackage ./monocraft-nerdfonts {};
  oranda = callPackage ./oranda {};
  patreon-dl = callPackage ./patreon-dl {};
  pidcat = callPackage ./pidcat {};
  rye = callPackage ./rye {};
  topgrade-og = callPackage ./topgrade-og {};
  twt = callPackage ./twt {};
  when = callPackage ./when {};
}
