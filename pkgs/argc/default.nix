{ stdenv, fetchFromGitHub, rustPlatform, pkgs ? import <nixpkgs> { } }:

rustPlatform.buildRustPackage rec {
  pname = "argc";
  version = "0.10.1";

  src = fetchFromGitHub {
    owner = "sigoden";
    repo = "argc";
    rev = "v${version}";
    sha256 = "sha256-RrrMOfW4nj9a0vQEP24GZoUHfx2ZsXk65CvWIv0TTq8=";
  };

  cargoSha256 = "sha256-aYtKcyR4RusIfBBnGgWpVVbGU5f0CDSGRiEnP+wqRfM=";

  meta = with pkgs.lib; {
    description = "A handy way to handle sh/bash cli parameters.";
    homepage = "https://github.com/sigoden/argc";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
