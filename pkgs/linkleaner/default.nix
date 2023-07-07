{
  lib,
  stdenv,
  darwin,
  makeRustPlatform,
  fromManifestFile,
  fetchFromGitHub,
  rust-manifest,
}: let
  toolchain = (fromManifestFile rust-manifest).minimalToolchain;
in
  (makeRustPlatform {
    cargo = toolchain;
    rustc = toolchain;
  })
  .buildRustPackage rec {
    pname = "linkleaner";
    version = "1.7.0";

    src = fetchFromGitHub {
      owner = "msfjarvis";
      repo = "linkleaner";
      rev = "v${version}";
      hash = "sha256-fmNVq4/TRbBrvytjBl9bw52JiFEp1GSgzrr/tRcx7pg=";
    };

    buildInputs =
      lib.optionals stdenv.isDarwin
      [darwin.apple_sdk.frameworks.Security];

    cargoHash = "sha256-lgnHVYfk7ZYDM/cqZA2/0wA4AsCAaoeB7zH6Kfv3mWM=";

    meta = with lib; {
      description = "A Telegram bot with an identity crisis";
      homepage = "https://msfjarvis.dev/g/linkleaner/";
      license = licenses.mit;
      platforms = platforms.all;
      maintainers = with maintainers; [msfjarvis];
    };
  }
