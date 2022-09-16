{ stdenv, fetchFromGitHub, rustPlatform, pkgs ? import <nixpkgs> { } }:

rustPlatform.buildRustPackage rec {
  pname = "comma";
  version = "1.3.0";

  src = fetchFromGitHub {
    owner = "nix-community";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-rXAX14yB8v9BOG4ZsdGEedpZAnNqhQ4DtjQwzFX/TLY=";
  };

  cargoSha256 = "sha256-9PVbiWmaTDx4iob5g9tXC+FV5Jmy6Id9tQxm05fJLkM=";

  meta = with pkgs.lib; {
    description = "Comma runs software without installing it.";
    homepage = "https://github.com/nix-community/comma";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
