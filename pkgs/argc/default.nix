{ stdenv, fetchFromGitHub, mkRustPlatform, pkgs ? import <nixpkgs> { } }:

mkRustPlatform.buildRustPackage rec {
  pname = "argc";
  version = "0.8.1";

  src = fetchFromGitHub {
    owner = "sigoden";
    repo = "argc";
    rev = "v${version}";
    sha256 = "sha256-yqx1WlHrayzSkKO0PGK9wUCIbmZ6azRx5iqbp8IA5ys=";
  };

  cargoSha256 = "sha256-SaBL5vcE9uM9Cj+CH2u1sDNEPH4Sbg0kPToTWaYEFMw=";

  meta = with pkgs.lib; {
    description = "A handy way to handle sh/bash cli parameters.";
    homepage = "https://github.com/sigoden/argc";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
