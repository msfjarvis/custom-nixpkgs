{ stdenv, fetchFromGitHub, rustPlatform, pkgs ? import <nixpkgs> { } }:

rustPlatform.buildRustPackage rec {
  pname = "argc";
  version = "0.8.2";

  src = fetchFromGitHub {
    owner = "sigoden";
    repo = "argc";
    rev = "v${version}";
    sha256 = "sha256-yOYk63z1MOEDDmc7CE8HCIgCdz6Qn4scv8eBGrsIXL0=";
  };

  cargoSha256 = "sha256-cIDsJYkjh3DWpfqqMO+JTf5YbGY5kL//QtZ2TFQTTT8=";

  meta = with pkgs.lib; {
    description = "A handy way to handle sh/bash cli parameters.";
    homepage = "https://github.com/sigoden/argc";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
