{pkgs}: let
  callPackage = pkg: pkgs.callPackage pkg;
in {
  adb-sync = callPackage ./adb-sync {inherit pkgs;};
  adbtuifm = callPackage ./adbtuifm {inherit pkgs;};
  adx = callPackage ./adx {inherit pkgs;};
  bundletool-bin = callPackage ./bundletool-bin {inherit pkgs;};
  cargo-dist = callPackage ./cargo-dist {inherit pkgs;};
  clipboard-substitutor = callPackage ./clipboard-substitutor {inherit pkgs;};
  diffuse-bin = callPackage ./diffuse-bin {inherit pkgs;};
  file-collector = callPackage ./file-collector {inherit pkgs;};
  gdrive = callPackage ./gdrive {inherit pkgs;};
  hcctl = callPackage ./hcctl {inherit pkgs;};
  healthchecks-monitor = callPackage ./healthchecks-monitor {inherit pkgs;};
  hyperlink = callPackage ./hyperlink {inherit pkgs;};
  katbin = callPackage ./katbin {inherit pkgs;};
  linkleaner = callPackage ./linkleaner {inherit pkgs;};
  monocraft-nerdfonts = callPackage ./monocraft-nerdfonts {inherit pkgs;};
  oranda = callPackage ./oranda {};
  patreon-dl = callPackage ./patreon-dl {};
  pidcat = callPackage ./pidcat {inherit pkgs;};
  topgrade-og = callPackage ./topgrade-og {inherit pkgs;};
  twt = callPackage ./twt {inherit pkgs;};
  when = callPackage ./when {inherit pkgs;};
}
