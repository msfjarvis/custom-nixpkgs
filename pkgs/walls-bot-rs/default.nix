{ stdenv, fetchFromGitHub, rustPlatform, pkgs ? import <nixpkgs> { } }:

let
  rust-overlay = import (builtins.fetchTarball {
    url =
      "https://github.com/oxalica/rust-overlay/archive/528499f67169671e931cf1ba63601803e58abd2a.tar.gz";
    sha256 = "sha256-Yid92tEY2CeS8VUiexjSw0hsjfQbRLbUCpqkdVLaEnI=";
  });
  rustPkgs = if pkgs.lib.hasAttrByPath [ "rust-bin" ] pkgs then
    pkgs
  else
    pkgs.lib.fix (pkgs.lib.extends rust-overlay (self: pkgs));
  rustSpecific = rustPkgs.rust-bin.nightly."2022-10-14".default.override {
    extensions = [ ];
    targets = pkgs.lib.optionals pkgs.stdenv.isDarwin [ "aarch64-apple-darwin" ]
      ++ pkgs.lib.optionals pkgs.stdenv.isLinux [ "x86_64-unknown-linux-gnu" ];
  };
  nightlyRustPlatform = rustPkgs.makeRustPlatform {
    cargo = rustSpecific;
    rustc = rustSpecific;
  };

in nightlyRustPlatform.buildRustPackage rec {
  pname = "walls-bot-rs";
  version = "0.19.3";

  src = fetchFromGitHub {
    owner = "msfjarvis";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-BRKTK+/LFCMNH3wWO2cWgeUoiWVGIImS5H6+eYfoZpQ=";
  };

  buildInputs = pkgs.lib.optionals stdenv.isDarwin
    [ pkgs.darwin.apple_sdk.frameworks.Security ];

  cargoSha256 = "sha256-bSZBUIDlO54ZHicapujexOVS0NrDvxMusv+0NnItffQ=";

  meta = with pkgs.lib; {
    description = "A Telegram bot with an identity crisis";
    homepage = "https://msfjarvis.dev/g/walls-bot-rs/";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
