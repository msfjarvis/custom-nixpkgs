{
  lib,
  stdenv,
  darwin,
  makeRustPlatform,
  fromToolchainFile,
  fetchFromGitHub,
}: let
  pname = "linkleaner";
  version = "1.5.2";

  src = fetchFromGitHub {
    owner = "msfjarvis";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-iBDiQC2+apEfgATi7ySTsZn7eNbBJHgLLdLUOFaGOXU=";
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
  .buildRustPackage {
    inherit pname version src;

    buildInputs =
      lib.optionals stdenv.isDarwin
      [darwin.apple_sdk.frameworks.Security];

    cargoHash = "sha256-bNqj8n89Kcv8uDcm82zTHJzZW3hCmCVB7nZkgjq/rrU=";

    meta = with lib; {
      description = "A Telegram bot with an identity crisis";
      homepage = "https://msfjarvis.dev/g/linkleaner/";
      license = licenses.mit;
      platforms = platforms.all;
      maintainers = with maintainers; [msfjarvis];
    };
  }
