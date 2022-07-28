{ stdenv, fetchFromGitHub, rustPlatform, pkgs ? import <nixpkgs> { } }:

rustPlatform.buildRustPackage rec {
  pname = "argc";
  version = "0.9.0";

  src = fetchFromGitHub {
    owner = "sigoden";
    repo = "argc";
    rev = "v${version}";
    sha256 = "sha256-VtkjzTWCyWxLB4sQhJx5C23BGFT81S7clkKCZ7M7IeI=";
  };

  cargoSha256 = "sha256-aDCZFoQ12g71QmeBD2Ufjlnm1Nm70EqhjCTgemOuvbs=";

  meta = with pkgs.lib; {
    description = "A handy way to handle sh/bash cli parameters.";
    homepage = "https://github.com/sigoden/argc";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
