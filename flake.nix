{
  description = "My personal NUR repository";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

  inputs.systems.url = "github:msfjarvis/flake-systems";

  inputs.fenix.url = "github:nix-community/fenix";
  inputs.fenix.inputs.nixpkgs.follows = "nixpkgs";

  inputs.rust-manifest.url = "https://static.rust-lang.org/dist/2023-06-10/channel-rust-nightly.toml";
  inputs.rust-manifest.flake = false;

  outputs = {
    self,
    nixpkgs,
    fenix,
    systems,
    rust-manifest,
  }: let
    eachSystem = nixpkgs.lib.genAttrs (import systems);
    pkgs = eachSystem (system: (nixpkgs.legacyPackages.${system}.extend fenix.overlays.default));
    packagesFn = pkgs:
      import ./default.nix {
        inherit pkgs rust-manifest;
        fenix = import fenix {inherit pkgs;};
      };
  in {
    packages = eachSystem (system: packagesFn pkgs.${system});
  };
}
