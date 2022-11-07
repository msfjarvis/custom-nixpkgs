{ stdenv, fetchFromGitHub, rustPlatform, pkgs ? import <nixpkgs> { } }:

let
  rustOverlay = import (builtins.fetchTarball {
    url =
      "https://github.com/oxalica/rust-overlay/archive/528499f67169671e931cf1ba63601803e58abd2a.tar.gz";
    sha256 = "sha256-Yid92tEY2CeS8VUiexjSw0hsjfQbRLbUCpqkdVLaEnI=";
  });
  rustPkgs = import <nixpkgs> { overlays = [ rustOverlay ]; };
  rustSpecific = rustPkgs.rust-bin.nightly."2022-10-14".default.override {
    extensions = [ ];
    targets = pkgs.lib.optionals pkgs.stdenv.isDarwin [ "aarch64-apple-darwin" ]
      ++ pkgs.lib.optionals pkgs.stdenv.isLinux [ "x86_64-unknown-linux-gnu" ];
  };
  nightlyRustPlatform = pkgs.makeRustPlatform {
    cargo = rustSpecific;
    rustc = rustSpecific;
  };

in nightlyRustPlatform.buildRustPackage rec {
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
