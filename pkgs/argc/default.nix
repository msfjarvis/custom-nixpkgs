{ stdenv, fetchFromGitHub, rustPlatform, pkgs ? import <nixpkgs> { } }:

rustPlatform.buildRustPackage rec {
  pname = "argc";
  version = "0.10.0";

  src = fetchFromGitHub {
    owner = "sigoden";
    repo = "argc";
    rev = "v${version}";
    sha256 = "sha256-jR1pJHilH1JFu8QSXsVbB8/5xcAuyk8+TyP4RieMDKs=";
  };

  cargoSha256 = "sha256-PUgTRQ3fy1DXyqBxsAhLHHMhuPO1wmgQHFkH3GeuAb4=";

  meta = with pkgs.lib; {
    description = "A handy way to handle sh/bash cli parameters.";
    homepage = "https://github.com/sigoden/argc";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
