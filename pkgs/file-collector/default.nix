{
  stdenv,
  pkgs,
}:
pkgs.rustPlatform.buildRustPackage rec {
  pname = "file-collector";
  version = "0.2.8";

  src = pkgs.fetchFromGitHub {
    owner = "msfjarvis";
    repo = "file-collector";
    rev = "v${version}";
    sha256 = "sha256-hPg9+hZw0Xvlclq/+om8ApkSgWN2wdQb8GEL0QojgXA=";
  };

  buildFeatures = pkgs.lib.optionals stdenv.isLinux ["journald"];
  cargoHash = "sha256-41gHv9tqo6TCfiUWKdKCpm5dZjXistbjODWdWI3f+Nw=";

  meta = with pkgs.lib; {
    description = "Simple CLI tool to watch directories and move their files to a single dumping ground";
    homepage = "https://msfjarvis.dev/g/file-collector";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
