{
  system ? builtins.currentSystem,
  pkgs ? import <nixpkgs> {inherit system;},
}:
rec {
}
// import ./pkgs {inherit pkgs;}
