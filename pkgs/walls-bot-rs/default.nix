{ stdenv, fetchFromGitHub, rustPlatform, pkgs ? import <nixpkgs> { } }:

rustPlatform.buildRustPackage rec {
  pname = "walls-bot-rs";
  version = "0.19.2";

  src = fetchFromGitHub {
    owner = "msfjarvis";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-X9gyAub5vpi0YQQu0fMG2FWSxB7MCrS6HlY2sGQtf2M=";
  };

  buildInputs = pkgs.lib.optionals stdenv.isDarwin
    [ pkgs.darwin.apple_sdk.frameworks.Security ];

  cargoSha256 = "sha256-dootwoSux3uFYqapBu6Wgv897Q/F1joNgJsypXM9GuI=";

  meta = with pkgs.lib; {
    description = "A Telegram bot with an identity crisis";
    homepage = "https://msfjarvis.dev/g/walls-bot-rs/";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
