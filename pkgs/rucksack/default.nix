{
  lib,
  rustPlatform,
  fetchFromGitHub,
  stdenv,
}:
rustPlatform.buildRustPackage rec {
  pname = "rucksack";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "msfjarvis";
    repo = "rucksack";
    rev = "v${version}";
    hash = "sha256-7rCUbVZ0evpwPfR/9G1LCCInWOiQWfZpD6chGR54bwA=";
  };

  buildFeatures = lib.optionals stdenv.isLinux ["journald"];
  cargoHash = "sha256-Ylb/tKFEweMWdgc1ZJs3WxdF7sRutC0d2oAVXu73nSI=";

  meta = with lib; {
    description = "Simple CLI tool to watch directories and move their files to a single dumping ground";
    homepage = "https://github.com/msfjarvis/rucksack";
    license = with licenses; [asl20 mit];
    maintainers = with maintainers; [msfjarvis];
    mainProgram = "rucksack";
  };
}
