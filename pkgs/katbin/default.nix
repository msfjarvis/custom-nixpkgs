{ stdenv, fetchFromGitHub, rustPlatform, pkgs ? import <nixpkgs> { } }:

rustPlatform.buildRustPackage rec {
  pname = "katbin";
  version = "1.3.6";

  src = fetchFromGitHub {
    owner = "SphericalKat";
    repo = "katbin-cli";
    rev = "v${version}";
    sha256 = "sha256-bCKhdOX6tCH4LWhgdXxwIkEs+N0PGWurvCgIMumaOaw=";
  };

  buildInputs = pkgs.lib.optionals stdenv.isDarwin
    [ pkgs.darwin.apple_sdk.frameworks.Security ];

  cargoSha256 = "sha256-nRhS5FMKH2ToFH5JAz0FBsU8SWlX1WQAschlc+4wcMc=";

  meta = with pkgs.lib; {
    description = "A CLI for katbin";
    homepage = "https://katb.in/";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
