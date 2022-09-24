{ stdenv, fetchFromGitHub, rustPlatform, pkgs ? import <nixpkgs> { } }:

rustPlatform.buildRustPackage rec {
  pname = "argc";
  version = "0.11.0";

  src = fetchFromGitHub {
    owner = "sigoden";
    repo = "argc";
    rev = "v${version}";
    sha256 = "sha256-ZjGXHOM9gnCadKKbof8LuJbcHg2ZJVDl33qR0hG4+r8=";
  };

  cargoSha256 = "sha256-LIQ/j4NMYwrwBQkEYlrqRobrfkPERwtWZqT8pwSoICA=";

  meta = with pkgs.lib; {
    description = "A handy way to handle sh/bash cli parameters.";
    homepage = "https://github.com/sigoden/argc";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
