{
  lib,
  rustPlatform,
  fetchFromGitHub,
  stdenv,
}:
rustPlatform.buildRustPackage rec {
  pname = "rucksack";
  version = "1.0.7";

  src = fetchFromGitHub {
    owner = "msfjarvis";
    repo = "rucksack";
    rev = "v${version}";
    hash = "sha256-kBrCknMM+yKS7uijkQ+K4cl8+DqoUD2ZzbKI4PlNyJE=";
  };

  buildFeatures = lib.optionals stdenv.isLinux ["journald"];
  cargoHash = "sha256-ZIb8/JOLk66R9r6cwOAQJna0CQP1KbZFnJ0iFpsOfr0=";

  useNextest = true;

  meta = with lib; {
    description = "Simple CLI tool to watch directories and move their files to a single dumping ground";
    homepage = "https://github.com/msfjarvis/rucksack";
    license = with licenses; [asl20 mit];
    maintainers = with maintainers; [msfjarvis];
    mainProgram = "rucksack";
  };
}
