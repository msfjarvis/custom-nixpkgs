{
  lib,
  rustPlatform,
  fetchFromGitHub,
  stdenv,
}:
rustPlatform.buildRustPackage rec {
  pname = "rucksack";
  version = "1.0.4";

  src = fetchFromGitHub {
    owner = "msfjarvis";
    repo = "rucksack";
    rev = "v${version}";
    hash = "sha256-LtiWzfxBWqV2LqgaOUc4J2Ha8j9+BIcEiX4FE56uYJM=";
  };

  buildFeatures = lib.optionals stdenv.isLinux ["journald"];
  cargoHash = "sha256-IcPVNlLxH7B+P7opQs9X1fQ/yqf6DcKM9CD2l3wddsA=";

  useNextest = true;

  meta = with lib; {
    description = "Simple CLI tool to watch directories and move their files to a single dumping ground";
    homepage = "https://github.com/msfjarvis/rucksack";
    license = with licenses; [asl20 mit];
    maintainers = with maintainers; [msfjarvis];
    mainProgram = "rucksack";
  };
}
