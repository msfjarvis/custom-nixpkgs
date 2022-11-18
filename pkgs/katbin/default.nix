{ stdenv, fetchFromGitHub, rustPlatform, pkgs ? import <nixpkgs> { } }:

rustPlatform.buildRustPackage rec {
  pname = "katbin";
  version = "1.3.12";

  src = fetchFromGitHub {
    owner = "SphericalKat";
    repo = "katbin-cli";
    rev = "v${version}";
    sha256 = "sha256-B/OY+FaErcXiVnxq0Z1Bqo7vmqwhb4w+x6MtwPekoKE=";
  };

  buildInputs = pkgs.lib.optionals stdenv.isDarwin
    [ pkgs.darwin.apple_sdk.frameworks.Security ];

  cargoSha256 = "sha256-BonkUOf0T0Hx/TD3vF5+BqeFIj7/2NnH6FJ1NuPcTxw=";

  meta = with pkgs.lib; {
    description = "A CLI for katbin";
    homepage = "https://katb.in/";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
