{ stdenv, fetchFromGitHub, rustPlatform, pkgs ? import <nixpkgs> { } }:

rustPlatform.buildRustPackage rec {
  pname = "helix";
  version = "0.0.6";
  doCheck = false;

  src = fetchFromGitHub {
    owner = "helix-editor";
    repo = "helix";
    rev = "v${version}";
    sha256 = "0hpp42km6c1kgd42b3h8xb5ddamp9hcblm91vmq5brs8rnr4q151";
    fetchSubmodules = true;
  };

  cargoSha256 = "04mja13c7g5lyy36rpka5g35266bhwf1lmkfwwabi4k3v9v04fq6";

  meta = with pkgs.lib; {
    description = "A post-modern modal text editor.";
    homepage = "https://github.com/helix-editor/helix";
    license = licenses.mpl20;
    platform = platforms.all;
  };
}
