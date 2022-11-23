{ pkgs ? import <nixpkgs> { } }:
let callPackage = pkg: pkgs.callPackage pkg;
in {
  adb-sync = callPackage ./adb-sync { inherit pkgs; };
  adx = callPackage ./adx { inherit pkgs; };
  bundletool-bin = callPackage ./bundletool-bin { inherit pkgs; };
  clipboard-substitutor = callPackage ./clipboard-substitutor { inherit pkgs; };
  comma = callPackage ./comma { inherit pkgs; };
  diffuse-bin = callPackage ./diffuse-bin { inherit pkgs; };
  file-collector = callPackage ./file-collector { inherit pkgs; };
  fsrx = callPackage ./fsrx { inherit pkgs; };
  gdrive = callPackage ./gdrive { inherit pkgs; };
  hcctl = callPackage ./hcctl { inherit pkgs; };
  healthchecks-monitor = callPackage ./healthchecks-monitor { inherit pkgs; };
  katbin = callPackage ./katbin { inherit pkgs; };
  pidcat = callPackage ./pidcat { inherit pkgs; };
  twt = callPackage ./twt { inherit pkgs; };
  walls-bot-rs = callPackage ./walls-bot-rs { inherit pkgs; };
  when = callPackage ./when { inherit pkgs; };
}