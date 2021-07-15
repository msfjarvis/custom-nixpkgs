{ stdenv, fetchFromGitHub, rustPlatform, pkgs ? import <nixpkgs> { } }:

rustPlatform.buildRustPackage rec {
  pname = "helix";
  version = "0.3.0";
  doCheck = false;

  src = fetchFromGitHub {
    owner = "helix-editor";
    repo = "helix";
    rev = "v${version}";
    sha256 = "sha256-dI5yIP5uUmM9pyMpvvdrk8/0jE/REkU/m9BF081LwMU=";
    fetchSubmodules = true;
  };

  cargoSha256 = "sha256-l3Ikr4IyUsHItJIC4BaIZZb6vio3bchumbbPI+nxIjQ=";

  meta = with pkgs.lib; {
    description = "A post-modern modal text editor.";
    homepage = "https://github.com/helix-editor/helix";
    license = licenses.mpl20;
    platform = platforms.all;
  };
}
