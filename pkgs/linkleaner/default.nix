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
  pname = "linkleaner";
  version = "1.0.0";

  src = pkgs.fetchFromGitHub {
    owner = "msfjarvis";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-2Ne9L7LOBK0flxAxiq2hSr4XEozL360kKa2EbS/FslM=";
  };

  buildInputs = pkgs.lib.optionals stdenv.isDarwin
    [ pkgs.darwin.apple_sdk.frameworks.Security ];

  cargoSha256 = "sha256-MopVmYjuYi5/fK4+/x1+40sBP87Fw2AE918x/OLcoD4=";

  meta = with pkgs.lib; {
    description = "A Telegram bot with an identity crisis";
    homepage = "https://msfjarvis.dev/g/linkleaner/";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
