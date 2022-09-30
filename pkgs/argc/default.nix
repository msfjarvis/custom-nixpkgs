{ stdenv, fetchFromGitHub, rustPlatform, pkgs ? import <nixpkgs> { } }:

rustPlatform.buildRustPackage rec {
  pname = "argc";
  version = "0.12.0";

  src = fetchFromGitHub {
    owner = "sigoden";
    repo = "argc";
    rev = "v${version}";
    sha256 = "sha256-Y6qXxnjep9AF3aAW6EZNx4dghMH3BSw8ExpNhTVH1QI=";
  };

  cargoSha256 = "sha256-Wr+sUtxxdmY6l+sMAcQGR3Zmqvj8qybC74o9ipkwTMk=";

  meta = with pkgs.lib; {
    description = "A handy way to handle sh/bash cli parameters.";
    homepage = "https://github.com/sigoden/argc";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
