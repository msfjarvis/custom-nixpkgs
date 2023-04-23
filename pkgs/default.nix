{
  pkgs,
  fenix,
}: let
  callPackage = pkg: pkgs.callPackage pkg;
in {
  adb-sync = callPackage ./adb-sync {};
  adbtuifm = callPackage ./adbtuifm {};
  adx = callPackage ./adx {};
  bundletool-bin = callPackage ./bundletool-bin {inherit pkgs;};
  cargo-dist = callPackage ./cargo-dist {};
  clipboard-substitutor = callPackage ./clipboard-substitutor {};
  diffuse-bin = callPackage ./diffuse-bin {inherit pkgs;};
  file-collector = callPackage ./file-collector {};
  gdrive = callPackage ./gdrive {};
  hcctl = callPackage ./hcctl {};
  healthchecks-monitor = callPackage ./healthchecks-monitor {};
  hyperlink = callPackage ./hyperlink {};
  katbin = callPackage ./katbin {};
  linkleaner = callPackage ./linkleaner {inherit (fenix) fromToolchainFile;};
  monocraft-nerdfonts = callPackage ./monocraft-nerdfonts {inherit pkgs;};
  oranda = callPackage ./oranda {};
  patreon-dl = callPackage ./patreon-dl {};
  pidcat = callPackage ./pidcat {inherit pkgs;};
  rye = callPackage ./rye {};
  topgrade-og = callPackage ./topgrade-og {};
  twt = callPackage ./twt {};
  when = callPackage ./when {};
}
