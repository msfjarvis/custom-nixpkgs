{ stdenv, fetchFromGitHub, rustPlatform, pkgs ? import <nixpkgs> { } }:

rustPlatform.buildRustPackage rec {
  pname = "helix";
  version = "0.4.0";
  doCheck = false;

  src = fetchFromGitHub {
    owner = "helix-editor";
    repo = "helix";
    rev = "v${version}";
    sha256 = "sha256-iCNA+gZer6BycWnhosDFRuxfS6QAb06XTix/vFsaey0=";
    fetchSubmodules = true;
  };

  cargoSha256 = "sha256-sqXPgtLMXa3kMQlnw2xDBEsVfjeRXO6Zp6NEFS/0h20=";

  meta = with pkgs.lib; {
    description = "A post-modern modal text editor.";
    homepage = "https://github.com/helix-editor/helix";
    license = licenses.mpl20;
    platform = platforms.all;
  };
}
