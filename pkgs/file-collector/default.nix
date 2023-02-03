{
  stdenv,
  pkgs,
}:
pkgs.rustPlatform.buildRustPackage rec {
  pname = "file-collector";
  version = "0.2.7";

  src = pkgs.fetchFromGitHub {
    owner = "msfjarvis";
    repo = "file-collector";
    rev = "v${version}";
    sha256 = "sha256-mbYRFSG0Cxn3ruO4I1VdduoS+KnCmU7WfGir2fWkfSI=";
  };

  buildFeatures = pkgs.lib.optionals stdenv.isLinux ["journald"];
  cargoHash = "sha256-3QTD9tx6oe17wNQ2iWFtqAueAa48NGJWkVi/NaYDeco=";

  meta = with pkgs.lib; {
    description = "Simple CLI tool to watch directories and move their files to a single dumping ground";
    homepage = "https://msfjarvis.dev/g/file-collector";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
