{
  lib,
  rustPlatform,
  fetchFromGitHub,
  stdenv,
}:
rustPlatform.buildRustPackage rec {
  pname = "file-collector";
  version = "0.3.2";

  src = fetchFromGitHub {
    owner = "msfjarvis";
    repo = "file-collector";
    rev = "v${version}";
    hash = "sha256-OAkNbH0K7NWrJ5iOd04IC5s4rseLQ2ZHc621MrByiPw=";
  };

  buildFeatures = lib.optionals stdenv.isLinux ["journald"];
  cargoHash = "sha256-7tO4NJM1KQG4oRXar0cOtijAd1wP+5Finj5ZGDQzZpw=";

  meta = with lib; {
    description = "Simple CLI tool to watch directories and move their files to a single dumping ground";
    homepage = "https://github.com/msfjarvis/file-collector";
    license = with licenses; [asl20 mit];
    maintainers = with maintainers; [msfjarvis];
  };
}
