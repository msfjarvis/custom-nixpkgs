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
    version = "1.6.3";

    src = fetchFromGitHub {
      owner = "msfjarvis";
      repo = pname;
      rev = "v${version}";
      sha256 = "sha256-AfEsHIGXDkDcGMKnOO6pJlU0jP2NW4AGRwaWgO7dGMo=";
    };

    buildInputs =
      lib.optionals stdenv.isDarwin
      [darwin.apple_sdk.frameworks.Security];

    cargoHash = "sha256-TSizebLvOFVIbFj1s1rOF96vQLEx5NhmdDc8qFkl8X8=";

    meta = with lib; {
      description = "A Telegram bot with an identity crisis";
      homepage = "https://msfjarvis.dev/g/linkleaner/";
      license = licenses.mit;
      platforms = platforms.all;
      maintainers = with maintainers; [msfjarvis];
    };
  }
