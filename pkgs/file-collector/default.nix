{ stdenv, fetchFromGitHub, rustPlatform, pkg-config, pkgs ? import <nixpkgs> { }
}:

rustPlatform.buildRustPackage rec {
  pname = "file-collector";
  version = "0.2.4";

  src = fetchFromGitHub {
    owner = "msfjarvis";
    repo = "file-collector";
    rev = "v${version}";
    sha256 = "sha256-oUU2DY34sknpbiXh2Y6dPz2A5Nx7d92uMwg4XS94wmg=";
  };

  buildFeatures = pkgs.lib.optionals stdenv.isLinux [ "journald" ];
  cargoSha256 = "sha256-8H1dkfhP5eCgaMAcwz7z4gcGebFLEALv+gyZpZB3Hv0=";

  meta = with pkgs.lib; {
    description =
      "Simple CLI tool to watch directories and move their files to a single dumping ground";
    homepage = "https://msfjarvis.dev/g/file-collector";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
