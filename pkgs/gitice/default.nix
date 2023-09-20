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
    version = "2.0.3";

    src = fetchFromGitHub {
      owner = "msfjarvis";
      repo = "gitice";
      rev = "v${version}";
      hash = "sha256-ouwlQXWhhGmy47/xvjA9Iw2tGMP0gC9e7tzIceHvVM8=";
    };

    cargoHash = "sha256-D69pQw2ZpEI4EMB17/gLYyDhy8bkQcSQwp3h/ffKXsA=";

    useNextest = true;

    meta = with lib; {
      description = "Snapshot your local git repositories for easy restoration";
      homepage = "https://github.com/msfjarvis/gitice";
      license = with licenses; [asl20 mit];
      maintainers = with maintainers; [msfjarvis];
      mainProgram = "gitice";
    };
  }
