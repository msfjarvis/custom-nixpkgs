{
  description = "My personal NUR repository";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

  inputs.systems.url = "github:msfjarvis/flake-systems";

  inputs.fenix.url = "github:nix-community/fenix";
  inputs.fenix.inputs.nixpkgs.follows = "nixpkgs";

  inputs.nix-github-actions.url = "github:nix-community/nix-github-actions";
  inputs.nix-github-actions.inputs.nixpkgs.follows = "nixpkgs";

  inputs.rust-manifest.url = "https://static.rust-lang.org/dist/2023-10-22/channel-rust-nightly.toml";
  inputs.rust-manifest.flake = false;

  outputs = {
    self,
    nixpkgs,
    fenix,
    nix-github-actions,
    systems,
    rust-manifest,
  }: let
    eachSystem = nixpkgs.lib.genAttrs (import systems);
    pkgs = eachSystem (system: (nixpkgs.legacyPackages.${system}.extend fenix.overlays.default));
    packagesFn = pkgs:
      import ./default.nix {
        inherit pkgs rust-manifest;
        inherit (pkgs) lib;
        fenix = import fenix {inherit pkgs;};
      };
  in {
    packages = eachSystem (system: packagesFn pkgs.${system});
    overlays.default = _: packagesFn;
    githubActions = nix-github-actions.lib.mkGithubMatrix {
      checks = nixpkgs.lib.getAttrs ["x86_64-linux"] self.packages;
    };

    formatter = eachSystem (system:
      pkgs.${system}.writeShellApplication {
        name = "format";
        runtimeInputs = with pkgs.${system}; [
          alejandra
          deadnix
          shfmt
          statix
        ];
        text = ''
          set -euo pipefail
          shfmt --write --simplify --language-dialect bash --indent 2 --case-indent --space-redirects .;
          deadnix --edit
          statix check . || statix fix .
          alejandra --quiet .
        '';
      });
  };
}
