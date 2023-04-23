{
  lib,
  stdenv,
  darwin,
  makeRustPlatform,
  fromToolchainFile,
  fetchFromGitHub,
}: let
  pname = "linkleaner";
  version = "1.5.1";

  src = fetchFromGitHub {
    owner = "msfjarvis";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-eYkGwFhh06RdHpPQZgikOiYfFt4Q8QrGeKv5IdMHUHg=";
  };
  toolchain = fromToolchainFile {
    file = "${src}/rust-toolchain.toml";
    sha256 = "sha256-1elQHBWEQRZ5qrEtJi6uhvwUNKedyQusyhATdBywep0=";
  };
in
  (makeRustPlatform {
    cargo = toolchain;
    rustc = toolchain;
  })
  .buildRustPackage rec {
    inherit pname version src;

    buildInputs =
      lib.optionals stdenv.isDarwin
      [darwin.apple_sdk.frameworks.Security];

    cargoHash = "sha256-j/KlfWxAxXvXEM9HRuoBKpT9u2F6EFZuVKqlFcplUGI=";

    meta = with lib; {
      description = "A Telegram bot with an identity crisis";
      homepage = "https://msfjarvis.dev/g/linkleaner/";
      license = licenses.mit;
      platforms = platforms.all;
    };
  }
