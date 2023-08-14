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
    version = "1.7.2";

    src = fetchFromGitHub {
      owner = "msfjarvis";
      repo = "linkleaner";
      rev = "v${version}";
      hash = "sha256-rggG++yWurLHN7xH9FC6xzsx6XEbNAc0HrW7AP1kf7A=";
    };

    buildInputs =
      lib.optionals stdenv.isDarwin
      [darwin.apple_sdk.frameworks.Security];

    cargoHash = "sha256-Uih+vvTrjA9LVk92oqcPt/kYRWnC//qokFQZ+jLffBE=";

    meta = with lib; {
      description = "A Telegram bot with an identity crisis";
      homepage = "https://msfjarvis.dev/g/linkleaner/";
      license = licenses.mit;
      platforms = platforms.all;
      maintainers = with maintainers; [msfjarvis];
      mainProgram = "linkleaner";
    };
  }
