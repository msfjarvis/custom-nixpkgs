{ stdenv, fetchFromGitHub, rustPlatform, pkgs ? import <nixpkgs> { } }:

rustPlatform.buildRustPackage rec {
  pname = "comma";
  version = "1.2.0";

  src = fetchFromGitHub {
    owner = "nix-community";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-emhvBaicLAnu/Kn4oxHngGa5BSxOEwbkhTLO5XvauMw=";
  };

  cargoSha256 = "sha256-dfi1gDqN7+dlQAT8E0NhbNk+rvauChqgd7TNJvd/u18=";

  meta = with pkgs.lib; {
    description = "Comma runs software without installing it.";
    homepage = "https://github.com/nix-community/comma";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
