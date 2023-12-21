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
    version = "1.8.1";

    src = fetchFromGitHub {
      owner = "msfjarvis";
      repo = "linkleaner";
      rev = "v${version}";
      hash = "sha256-iH5jUdlOlqcz07PHRWogKdtGTeTDgJXVfWLNkt2eoqs=";
    };

    buildInputs = lib.optionals stdenv.isDarwin [
      darwin.apple_sdk.frameworks.Security
      darwin.apple_sdk.frameworks.SystemConfiguration
    ];

    cargoHash = "sha256-D84QGXR0Tc7T+l68B3LtCtajbyeJa7/gZBG5NhdEcqw=";

    useNextest = true;

    meta = with lib; {
      description = "A Telegram bot with an identity crisis";
      homepage = "https://msfjarvis.dev/g/linkleaner/";
      license = licenses.mit;
      platforms = platforms.all;
      maintainers = with maintainers; [msfjarvis];
      mainProgram = "linkleaner";
    };
  }
