{ pkgs ? import <nixpkgs> { } }:

let mkRustPlatform = import ./lib/mk-rust-platform.nix;
in with pkgs; {
  lib = import ./lib { inherit pkgs; }; # functions
  modules = import ./modules; # NixOS modules
  overlays = import ./overlays; # nixpkgs overlays

  adb-sync = callPackage ./pkgs/adb-sync { };
  adx = callPackage ./pkgs/adx { inherit mkRustPlatform; };
  argc = callPackage ./pkgs/argc { inherit mkRustPlatform; };
  bundletool-bin = callPackage ./pkgs/bundletool-bin { };
  clipboard-substitutor =
    callPackage ./pkgs/clipboard-substitutor { inherit mkRustPlatform; };
  comma = callPackage ./pkgs/comma { inherit mkRustPlatform; };
  diffuse-bin = callPackage ./pkgs/diffuse-bin { };
  gdrive = callPackage ./pkgs/gdrive { };
  hcctl = callPackage ./pkgs/hcctl { inherit mkRustPlatform; };
  healthchecks-monitor =
    callPackage ./pkgs/healthchecks-monitor { inherit mkRustPlatform; };
  jetbrains-mono-nerdfonts = callPackage ./pkgs/jetbrains-mono-nerdfonts { };
  jless = callPackage ./pkgs/jless { inherit mkRustPlatform; };
  katbin = callPackage ./pkgs/katbin { inherit mkRustPlatform; };
  pidcat = callPackage ./pkgs/pidcat { };
  when = callPackage ./pkgs/when { inherit mkRustPlatform; };
}
