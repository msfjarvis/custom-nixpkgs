{
  lib,
  rustPlatform,
  fetchFromGitHub,
  stdenv,
}:
rustPlatform.buildRustPackage rec {
  pname = "file-collector";
  version = "0.2.8";

  src = fetchFromGitHub {
    owner = "msfjarvis";
    repo = "file-collector";
    rev = "v${version}";
    hash = "sha256-hPg9+hZw0Xvlclq/+om8ApkSgWN2wdQb8GEL0QojgXA=";
  };

  buildFeatures = lib.optionals stdenv.isLinux ["journald"];
  cargoHash = "sha256-41gHv9tqo6TCfiUWKdKCpm5dZjXistbjODWdWI3f+Nw=";

  meta = with lib; {
    description = "Simple CLI tool to watch directories and move their files to a single dumping ground";
    homepage = "https://github.com/msfjarvis/file-collector";
    license = with licenses; [asl20 mit];
    maintainers = with maintainers; [];
  };
}
