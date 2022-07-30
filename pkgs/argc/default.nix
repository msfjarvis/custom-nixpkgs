{ stdenv, fetchFromGitHub, rustPlatform, pkgs ? import <nixpkgs> { } }:

rustPlatform.buildRustPackage rec {
  pname = "argc";
  version = "0.9.2";

  src = fetchFromGitHub {
    owner = "sigoden";
    repo = "argc";
    rev = "v${version}";
    sha256 = "sha256-om1XMxhkaTSC4cRO8IE8bVmBaqH4kuZfHaFhtQRnrZY=";
  };

  cargoSha256 = "sha256-rJ3/BPDGOla39tSD5IU4Q8/EUQhCrOVRSkv3hrMqlL8=";

  meta = with pkgs.lib; {
    description = "A handy way to handle sh/bash cli parameters.";
    homepage = "https://github.com/sigoden/argc";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
