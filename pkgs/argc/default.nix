{ stdenv, fetchFromGitHub, mkRustPlatform, pkgs ? import <nixpkgs> { } }:

mkRustPlatform.buildRustPackage rec {
  pname = "argc";
  version = "0.2.3";

  src = fetchFromGitHub {
    owner = "sigoden";
    repo = "argc";
    rev = "v${version}";
    sha256 = "sha256-h/2fZwRsXMn8ctEuX2KbLvkMVkaYbC08KDZAM/p7At8=";
  };

  cargoSha256 = "sha256-9SfUJZ28EYP8p7VfvWfX6SDIuRgDLJGOTrAq98gGK2Q=";

  meta = with pkgs.lib; {
    description = "A handy way to handle sh/bash cli parameters.";
    homepage = "https://github.com/sigoden/argc";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
