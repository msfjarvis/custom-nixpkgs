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
    version = "1.6.5";

    src = fetchFromGitHub {
      owner = "msfjarvis";
      repo = pname;
      rev = "v${version}";
      sha256 = "sha256-VFlII0YwhdlkGOCGM4Rd/t06x9vxbt03Qym86+pZlRQ=";
    };

    buildInputs =
      lib.optionals stdenv.isDarwin
      [darwin.apple_sdk.frameworks.Security];

    cargoHash = "sha256-rhIg8vZ4QMWYDxyIqwFZCgZpmhmlo4z4Tjg1VmkqDCk=";

    meta = with lib; {
      description = "A Telegram bot with an identity crisis";
      homepage = "https://msfjarvis.dev/g/linkleaner/";
      license = licenses.mit;
      platforms = platforms.all;
      maintainers = with maintainers; [msfjarvis];
    };
  }
