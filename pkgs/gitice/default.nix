{
  lib,
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
    pname = "gitice";
    version = "2.0.1";

    src = fetchFromGitHub {
      owner = "msfjarvis";
      repo = "gitice";
      rev = "v${version}";
      hash = "sha256-jTT3kApniYalLdhasvVX86a3+6N/7QLinH9Jem2YeHg=";
    };

    cargoHash = "sha256-C1kQFXojIuEcwM1niwhqSEWxZSN0JDWeEUz6jMuJrpQ=";

    meta = with lib; {
      description = "Snapshot your local git repositories for easy restoration";
      homepage = "https://github.com/msfjarvis/gitice";
      license = with licenses; [asl20 mit];
      maintainers = with maintainers; [msfjarvis];
    };
  }
