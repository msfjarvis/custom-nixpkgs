{
  lib,
  rustPlatform,
  fetchFromGitHub,
  stdenv,
}:
rustPlatform.buildRustPackage rec {
  pname = "file-collector";
  version = "0.2.9";

  src = fetchFromGitHub {
    owner = "msfjarvis";
    repo = "file-collector";
    rev = "v${version}";
    hash = "sha256-EJ91neIT/apzt4fNO9PpeP0XA4PTN+5kMenRszIcyW4=";
  };

  buildFeatures = lib.optionals stdenv.isLinux ["journald"];
  cargoHash = "sha256-zntjbTJVRyziznq1iZNRZhz+8HstLQIhZvT6ae/LO38=";

  meta = with lib; {
    description = "Simple CLI tool to watch directories and move their files to a single dumping ground";
    homepage = "https://github.com/msfjarvis/file-collector";
    license = with licenses; [asl20 mit];
    maintainers = with maintainers; [msfjarvis];
  };
}
