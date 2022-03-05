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
    description =
      "Rust binary that polls Google's Maven repository and extracts the latest version of all dependencies, with as few network calls as possible.";
    homepage = "https://github.com/msfjarvis/androidx-release-watcher";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
