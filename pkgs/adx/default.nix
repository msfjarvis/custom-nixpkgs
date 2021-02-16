{ stdenv, fetchFromGitHub, rustPlatform, pkgs ? import <nixpkgs> { } }:

rustPlatform.buildRustPackage rec {
  pname = "adx";
  version = "3.0.0";

  src = fetchFromGitHub {
    owner = "msfjarvis";
    repo = "androidx-release-watcher";
    rev = "v${version}";
    sha256 = "0fac83wzqakr61yis2yrs6sahvjx3p4sfalibg6jkbcldzy7mpd6";
  };

  cargoSha256 = "0ni6xm24920m35pf23c8aw4adcl0lcab1zyamizib6wh75400xvl";

  meta = with pkgs.lib; {
    description =
      "Rust binary that polls Google's Maven repository and extracts the latest version of all dependencies, with as few network calls as possible.";
    homepage = "https://github.com/msfjarvis/androidx-release-watcher";
    license = licenses.mit;
    platforms = platforms.unix;
  };
}
