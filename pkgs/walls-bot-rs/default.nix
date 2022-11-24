{ stdenv, pkgs }:

let
  rust-overlay = import (builtins.fetchTarball {
    url =
      "https://github.com/oxalica/rust-overlay/archive/5200195aa2a0cef1becc2ba6ff61cba65e1f90fe.tar.gz";
    sha256 = "sha256-3oGeJgeA4+8Wj2XZnbZKJYHoZziyJl36ZGU49I2VC8U=";
  });
  rustPkgs = if pkgs.lib.hasAttrByPath [ "rust-bin" ] pkgs then
    pkgs
  else
    pkgs.lib.fix (pkgs.lib.extends rust-overlay (self: pkgs));
  rustSpecific = rustPkgs.rust-bin.nightly."2022-11-14".default.override {
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
  version = "0.20.2";

  src = pkgs.fetchFromGitHub {
    owner = "msfjarvis";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-46w29rMuTePleFHqO+3ogslwpYvzKISWtL8j/X4+xmg=";
  };

  buildInputs = pkgs.lib.optionals stdenv.isDarwin
    [ pkgs.darwin.apple_sdk.frameworks.Security ];

  cargoSha256 = "sha256-WRAXTAWFBQILhcOehhuzlx4jchFl49XwAlCs4GTat3k=";

  meta = with pkgs.lib; {
    description = "A Telegram bot with an identity crisis";
    homepage = "https://msfjarvis.dev/g/walls-bot-rs/";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
