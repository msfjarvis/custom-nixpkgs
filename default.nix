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
  fsrx = callPackage ./pkgs/fsrx { };
  gdrive = callPackage ./pkgs/gdrive { };
  hcctl = callPackage ./pkgs/hcctl { };
  healthchecks-monitor = callPackage ./pkgs/healthchecks-monitor { };
  jetbrains-mono-nerdfonts = callPackage ./pkgs/jetbrains-mono-nerdfonts { };
  jless = callPackage ./pkgs/jless { };
  katbin = callPackage ./pkgs/katbin { };
  lurk = callPackage ./pkgs/lurk { };
  pidcat = callPackage ./pkgs/pidcat { };
  when = callPackage ./pkgs/when { };
}
