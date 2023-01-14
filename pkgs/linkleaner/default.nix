{
  stdenv,
  pkgs,
}: let
  rust-overlay = import (builtins.fetchTarball {
    url = "https://github.com/oxalica/rust-overlay/archive/7da2f6b3a0c32f661cb2864d7fbd1d7e6f0c7543.tar.gz";
    sha256 = "sha256-gvQaOKaV1UK6IzsFzkVLsEavGxnAsQFT3zUqcg0RXLU=";
  });
  rustPkgs =
    if pkgs.lib.hasAttrByPath ["rust-bin"] pkgs
    then pkgs
    else pkgs.lib.fix (pkgs.lib.extends rust-overlay (self: pkgs));
  rustSpecific = rustPkgs.rust-bin.nightly."2022-12-15".default.override {
    extensions = [];
    targets =
      pkgs.lib.optionals pkgs.stdenv.isDarwin ["aarch64-apple-darwin"]
      ++ pkgs.lib.optionals pkgs.stdenv.isLinux ["x86_64-unknown-linux-gnu"];
  };
  nightlyRustPlatform = rustPkgs.makeRustPlatform {
    cargo = rustSpecific;
    rustc = rustSpecific;
  };
in
  nightlyRustPlatform.buildRustPackage rec {
    pname = "linkleaner";
    version = "1.4.5";

    src = pkgs.fetchFromGitHub {
      owner = "msfjarvis";
      repo = pname;
      rev = "v${version}";
      sha256 = "sha256-ZtuSCeA2KJceg5bC0AB07HSscYpJzvwgHfZkgvrI5gI=";
    };

    buildInputs =
      pkgs.lib.optionals stdenv.isDarwin
      [pkgs.darwin.apple_sdk.frameworks.Security];

    # buildFeatures = ["console" "journald"];
    # RUSTFLAGS = "--cfg tokio_unstable";

    cargoHash = "sha256-gGZEt4qTFpzG10psi3gEs6McARJDy+AeQYIqAlOxrIo=";

    meta = with pkgs.lib; {
      description = "A Telegram bot with an identity crisis";
      homepage = "https://msfjarvis.dev/g/linkleaner/";
      license = licenses.mit;
      platforms = platforms.all;
    };
  }
