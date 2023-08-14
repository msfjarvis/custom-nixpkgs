{
  lib,
  rustPlatform,
  fetchFromGitHub,
  stdenv,
}:
rustPlatform.buildRustPackage rec {
  pname = "file-collector";
  version = "0.4.0";

  src = fetchFromGitHub {
    owner = "msfjarvis";
    repo = "file-collector";
    rev = "v${version}";
    hash = "sha256-Tw0bUATK8DfQ5J/4Oxg0SoQ9r491PFZLRKTd9kxZGZ0=";
  };

  buildFeatures = lib.optionals stdenv.isLinux ["journald"];
  cargoHash = "sha256-xwBMb9qVjg2BpY9mznxzc2mPFrszo5ddHq5e0WLBe6w=";

  meta = with lib; {
    description = "Simple CLI tool to watch directories and move their files to a single dumping ground";
    homepage = "https://github.com/msfjarvis/file-collector";
    license = with licenses; [asl20 mit];
    maintainers = with maintainers; [msfjarvis];
  };
}
