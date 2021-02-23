{ pkgs ? import <nixpkgs> { } }:

{
  lib = import ./lib { inherit pkgs; }; # functions
  modules = import ./modules; # NixOS modules
  overlays = import ./overlays; # nixpkgs overlays

  adb-sync = pkgs.callPackage ./pkgs/adb-sync { };
  adx = pkgs.callPackage ./pkgs/adx { };
  fclones = pkgs.callPackage ./pkgs/fclones { };
  git-quickfix = pkgs.callPackage ./pkgs/git-quickfix { };
  jetbrains-mono-nerdfonts =
    pkgs.callPackage ./pkgs/jetbrains-mono-nerdfonts { };
  lychee = pkgs.callPackage ./pkgs/lychee { };
  pidcat = pkgs.callPackage ./pkgs/pidcat { };
}
