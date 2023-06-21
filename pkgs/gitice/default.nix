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
    version = "2.0.2";

    src = fetchFromGitHub {
      owner = "msfjarvis";
      repo = "gitice";
      rev = "v${version}";
      hash = "sha256-y2U4SHMendU8K5DMgTLdDeIlNHNWNO5zUrQbl6Y3xx4=";
    };

    cargoHash = "sha256-UefcLP/V14PEvDPhcjacoUmsFMxwN/lW1pR/lio1EfU=";

    meta = with lib; {
      description = "Snapshot your local git repositories for easy restoration";
      homepage = "https://github.com/msfjarvis/gitice";
      license = with licenses; [asl20 mit];
      maintainers = with maintainers; [msfjarvis];
    };
  }
