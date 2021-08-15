{ stdenv, fetchFromGitHub, rustPlatform, pkgs ? import <nixpkgs> { } }:

rustPlatform.buildRustPackage rec {
  pname = "helix";
  version = "0.4.1";
  doCheck = false;

  src = fetchFromGitHub {
    owner = "helix-editor";
    repo = "helix";
    rev = "v${version}";
    sha256 = "sha256-lScMHZ/pLcHkuvv8kSKnYK5AFVxyhOUMFdsu3nlDVD0=";
    fetchSubmodules = true;
  };

  cargoSha256 = "sha256-N5vlPoYyksHEZsyia8u8qtoEBY6qsXqO9CRBFaTQmiw=";

  meta = with pkgs.lib; {
    description = "A post-modern modal text editor.";
    homepage = "https://github.com/helix-editor/helix";
    license = licenses.mpl20;
    platform = platforms.all;
  };
}
