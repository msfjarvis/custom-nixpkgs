{
  description = "My personal NUR repository";
  inputs = { nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable"; };
  outputs = { self, nixpkgs, }@inputs:
    let
      systems = [ "x86_64-linux" "x86_64-darwin" "aarch64-linux" ];
      forAllSystems = nixpkgs.lib.genAttrs systems;
    in {
      packages = forAllSystems (system:
        import ./default.nix { pkgs = import nixpkgs { inherit system; }; });
    };
}
