{ stdenv, fetchFromGitHub, rustPlatform, pkgs ? import <nixpkgs> { } }:

rustPlatform.buildRustPackage rec {
  pname = "comma";
  version = "1.2.3";

  src = fetchFromGitHub {
    owner = "nix-community";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-emhvBaicLAnu/Kn4oxHngGa5BSxOEwbkhTLO5XvauMw=";
  };

  cargoSha256 = "sha256-mQxNo4VjW2Q0MYfU+RCb4Ayl9ClpxrSV8X4EKZ7PewA=";

  meta = with pkgs.lib; {
    description = "Comma runs software without installing it.";
    homepage = "https://github.com/nix-community/comma";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
