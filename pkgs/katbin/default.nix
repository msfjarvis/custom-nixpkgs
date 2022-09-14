{ stdenv, fetchFromGitHub, rustPlatform, pkgs ? import <nixpkgs> { } }:

rustPlatform.buildRustPackage rec {
  pname = "katbin";
  version = "1.3.8";

  src = fetchFromGitHub {
    owner = "SphericalKat";
    repo = "katbin-cli";
    rev = "v${version}";
    sha256 = "sha256-7XFoZqXNqux1euayFztkF8Rox70ijOeHsWZkP4gIEiI=";
  };

  buildInputs = pkgs.lib.optionals stdenv.isDarwin
    [ pkgs.darwin.apple_sdk.frameworks.Security ];

  cargoSha256 = "sha256-RcRbaTnijn50aU8hYbmyV0RqlXiQpy9FQpJ4r2u36ec=";

  meta = with pkgs.lib; {
    description = "A CLI for katbin";
    homepage = "https://katb.in/";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
