{ pkgs ? import <nixpkgs> { } }:

with pkgs; {
  lib = import ./lib { inherit pkgs; }; # functions
  modules = import ./modules; # NixOS modules
  overlays = import ./overlays; # nixpkgs overlays

  adb-sync = callPackage ./pkgs/adb-sync { };
  adx = callPackage ./pkgs/adx { };
  bundletool-bin = callPackage ./pkgs/bundletool-bin { };
  diffuse-bin = callPackage ./pkgs/diffuse-bin { };
  gdrive = callPackage ./pkgs/gdrive { };
  git-quickfix = callPackage ./pkgs/git-quickfix { };
  hcctl = callPackage ./pkgs/hcctl { };
  healthchecks-monitor = callPackage ./pkgs/healthchecks-monitor { };
  jetbrains-mono-nerdfonts =
    callPackage ./pkgs/jetbrains-mono-nerdfonts { };
  lychee = callPackage ./pkgs/lychee { };
  natls = callPackage ./pkgs/natls { };
  pidcat = callPackage ./pkgs/pidcat { };
}
