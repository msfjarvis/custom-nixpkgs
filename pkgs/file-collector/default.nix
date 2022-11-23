{ stdenv, pkgs }:

pkgs.rustPlatform.buildRustPackage rec {
  pname = "file-collector";
  version = "0.2.5";

  src = pkgs.fetchFromGitHub {
    owner = "msfjarvis";
    repo = "file-collector";
    rev = "v${version}";
    sha256 = "sha256-ch1Qzm9a/Fjgr1jV5bc4XRjbmVehGOan5xLIAkDjAzk=";
  };

  buildFeatures = pkgs.lib.optionals stdenv.isLinux [ "journald" ];
  cargoSha256 = "sha256-yXV5dFdPprrURFDvmu38G5BzTPNdhv8cHiASd1KGftM=";

  meta = with pkgs.lib; {
    description =
      "Simple CLI tool to watch directories and move their files to a single dumping ground";
    homepage = "https://msfjarvis.dev/g/file-collector";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
