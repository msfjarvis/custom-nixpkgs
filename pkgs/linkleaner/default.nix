{
  stdenv,
  pkgs,
}: let
  pname = "linkleaner";
  version = "1.5.0";

  src = pkgs.fetchFromGitHub {
    owner = "msfjarvis";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-Yhyi7XsC/j2yPxXcEF/UROVzsjeJ5mRk+K4evRrlTfI=";
  };
  rust-overlay = import (builtins.fetchTarball {
    url = "https://github.com/oxalica/rust-overlay/archive/32e4b1bf80cf99b7c72d2892198d40558828e6a1.tar.gz";
    sha256 = "sha256-OZxPSyEDJTy4IATwFxUGDEEUYL6ZkgKn2FhlRlcLE08=";
  });
  rustPkgs =
    if pkgs.lib.hasAttrByPath ["rust-bin"] pkgs
    then pkgs
    else pkgs.lib.fix (pkgs.lib.extends rust-overlay (self: pkgs));
  rustSpecific = rustPkgs.rust-bin.fromRustupToolchainFile "${src}/rust-toolchain.toml";
  nightlyRustPlatform = rustPkgs.makeRustPlatform {
    cargo = rustSpecific;
    rustc = rustSpecific;
  };
in
  nightlyRustPlatform.buildRustPackage rec {
    inherit pname version src;

    buildInputs =
      pkgs.lib.optionals stdenv.isDarwin
      [pkgs.darwin.apple_sdk.frameworks.Security];

    # buildFeatures = ["console" "journald"];
    # RUSTFLAGS = "--cfg tokio_unstable";

    cargoHash = "sha256-/4s2hMs5q1JS9yQCUORf1kCGMPRMio3UhzleIfCw4SM=";

    meta = with pkgs.lib; {
      description = "A Telegram bot with an identity crisis";
      homepage = "https://msfjarvis.dev/g/linkleaner/";
      license = licenses.mit;
      platforms = platforms.all;
    };
  }
