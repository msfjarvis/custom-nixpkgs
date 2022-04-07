{ stdenv, fetchFromGitHub, rustPlatform, pkgs ? import <nixpkgs> { } }:

rustPlatform.buildRustPackage rec {
  pname = "argc";
  version = "0.4.0";

  src = fetchFromGitHub {
    owner = "sigoden";
    repo = "argc";
    rev = "v${version}";
    sha256 = "sha256-AWnOa0QnsIQvrp6f1QrN8wrFCd0nIDLNfZ2cyy/J7Gw=";
  };

  cargoSha256 = "sha256-XXoUYgS2w24NlUNA6MZGe3O6zFygWT8OrFPWdqT2XSE=";

  meta = with pkgs.lib; {
    description = "A handy way to handle sh/bash cli parameters.";
    homepage = "https://github.com/sigoden/argc";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
