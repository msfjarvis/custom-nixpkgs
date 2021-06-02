{ stdenv, fetchFromGitHub, rustPlatform, pkgs ? import <nixpkgs> { } }:

rustPlatform.buildRustPackage rec {
  pname = "helix";
  version = "0.0.7";
  doCheck = false;

  src = fetchFromGitHub {
    owner = "helix-editor";
    repo = "helix";
    rev = "v${version}";
    sha256 = "1xw6ss2ix8rw0zllpaaydlhawz5f1q8q8aphli8clnf34ndpxnch";
    fetchSubmodules = true;
  };

  cargoSha256 = "16dnk16l0q53vji81xlaqi2m47dd6la0kf881vgn3nz7qhsmymm7";

  meta = with pkgs.lib; {
    description = "A post-modern modal text editor.";
    homepage = "https://github.com/helix-editor/helix";
    license = licenses.mpl20;
    platform = platforms.all;
  };
}
