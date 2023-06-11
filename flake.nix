{
  description = "My personal NUR repository";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    fenix = {
      url = "github:nix-community/fenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    rust-manifest = {
      url = "https://static.rust-lang.org/dist/2023-02-22/channel-rust-nightly.toml";
      flake = false;
    };
  };
  outputs = {
    self,
    nixpkgs,
    fenix,
    rust-manifest,
  }: let
    systems = ["x86_64-linux" "aarch64-linux" "aarch64-darwin"];
    forAllSystems = nixpkgs.lib.genAttrs systems;
  in {
    packages = forAllSystems (system: let
      pkgs = import nixpkgs {
        inherit system;
        overlays = [fenix.overlays.default];
      };
    in
      import ./default.nix {
        inherit pkgs rust-manifest;
        fenix = import fenix {inherit pkgs;};
      });
  };
}
