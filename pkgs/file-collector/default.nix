{ stdenv, fetchFromGitHub, rustPlatform, pkg-config, pkgs ? import <nixpkgs> { }
}:

rustPlatform.buildRustPackage rec {
  pname = "file-collector";
  version = "0.2.1";

  src = fetchFromGitHub {
    owner = "msfjarvis";
    repo = "file-collector";
    rev = "v${version}";
    sha256 = "sha256-Zr++jtJiuoE7j6tF6rBquQ3MmmzDFDPGrvfMBoDrP7Y=";
  };

  buildFeatures = pkgs.lib.optionals stdenv.isLinux [ "journald" ];
  cargoSha256 = "sha256-n8GdZ3nRVF6WM4oi3sUu81O0kz8mikgUDExx7pbechI=";

  meta = with pkgs.lib; {
    description =
      "Simple CLI tool to watch directories and move their files to a single dumping ground";
    homepage = "https://msfjarvis.dev/g/file-collector";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
