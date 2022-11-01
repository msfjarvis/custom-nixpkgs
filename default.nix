{ pkgs ? import <nixpkgs> { } }:

with pkgs; {
  lib = import ./lib { inherit pkgs; }; # functions
  modules = import ./modules; # NixOS modules
  overlays = import ./overlays; # nixpkgs overlays

  adb-sync = callPackage ./pkgs/adb-sync { };
  adx = callPackage ./pkgs/adx { };
  argc = callPackage ./pkgs/argc { };
  bundletool-bin = callPackage ./pkgs/bundletool-bin { };
  clipboard-substitutor = callPackage ./pkgs/clipboard-substitutor { };
  comma = callPackage ./pkgs/comma { };
  diffuse-bin = callPackage ./pkgs/diffuse-bin { };
  file-collector = callPackage ./pkgs/file-collector { };
  fsrx = callPackage ./pkgs/fsrx { };
  gdrive = callPackage ./pkgs/gdrive { };
  hcctl = callPackage ./pkgs/hcctl { };
  healthchecks-monitor = callPackage ./pkgs/healthchecks-monitor { };
  jless = callPackage ./pkgs/jless { };
  katbin = callPackage ./pkgs/katbin { };
  pidcat = callPackage ./pkgs/pidcat { };
  twt = callPackage ./pkgs/twt { };
  when = callPackage ./pkgs/when { };
}
