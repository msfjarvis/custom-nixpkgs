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
    version = "1.6.2";

    src = fetchFromGitHub {
      owner = "msfjarvis";
      repo = pname;
      rev = "v${version}";
      sha256 = "sha256-K2bsJIAHiDz/xfHdtBeWKuLWsTGJShQRzzE17TYgx9E=";
    };

    buildInputs =
      lib.optionals stdenv.isDarwin
      [darwin.apple_sdk.frameworks.Security];

    cargoHash = "sha256-g1Rxfh6+V1jokGv/8B9LYwYyPp3GyM/NRovlpKCEMb0=";

    meta = with lib; {
      description = "A Telegram bot with an identity crisis";
      homepage = "https://msfjarvis.dev/g/linkleaner/";
      license = licenses.mit;
      platforms = platforms.all;
      maintainers = with maintainers; [msfjarvis];
    };
  }
