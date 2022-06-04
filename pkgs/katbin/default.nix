{ stdenv, fetchFromGitHub, mkRustPlatform, pkgs ? import <nixpkgs> { } }:

mkRustPlatform.buildRustPackage rec {
  pname = "katbin";
  version = "1.3.2";

  src = fetchFromGitHub {
    owner = "SphericalKat";
    repo = "katbin-cli";
    rev = "v${version}";
    sha256 = "sha256-co3VETSO2G9HDym3h7u48jRUsHsG+je1LAXdnitn4yo=";
  };

  buildInputs = pkgs.lib.optionals stdenv.isDarwin
    [ pkgs.darwin.apple_sdk.frameworks.Security ];

  cargoSha256 = "sha256-RKxC2263HrLJtuiHIsAI1IpKh2RBeqEXMBx1kHB4kVs=";

  meta = with pkgs.lib; {
    description = "A CLI for katbin";
    homepage = "https://katb.in/";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
