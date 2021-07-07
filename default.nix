{ pkgs ? import <nixpkgs> { } }:

{
  lib = import ./lib { inherit pkgs; }; # functions
  modules = import ./modules; # NixOS modules
  overlays = import ./overlays; # nixpkgs overlays

  adb-sync = pkgs.callPackage ./pkgs/adb-sync { };
  adx = pkgs.callPackage ./pkgs/adx { };
  bundletool-bin = pkgs.callPackage ./pkgs/bundletool-bin { };
  diffuse-bin = pkgs.callPackage ./pkgs/diffuse-bin { };
  fclones = pkgs.callPackage ./pkgs/fclones { };
  gdrive = pkgs.callPackage ./pkgs/gdrive { };
  git-branchless = pkgs.callPackage ./pkgs/git-branchless { };
  git-quickfix = pkgs.callPackage ./pkgs/git-quickfix { };
  grit = pkgs.callPackage ./pkgs/grit { };
  helix = pkgs.callPackage ./pkgs/helix { };
  jetbrains-mono-nerdfonts =
    pkgs.callPackage ./pkgs/jetbrains-mono-nerdfonts { };
  lychee = pkgs.callPackage ./pkgs/lychee { };
  natls = pkgs.callPackage ./pkgs/natls { };
  pidcat = pkgs.callPackage ./pkgs/pidcat { };
  rust-script = pkgs.callPackage ./pkgs/rust-script { };
}
