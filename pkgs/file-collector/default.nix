{ stdenv, fetchFromGitHub, rustPlatform, pkg-config, pkgs ? import <nixpkgs> { }
}:

rustPlatform.buildRustPackage rec {
  pname = "file-collector";
  version = "0.2.3";

  src = fetchFromGitHub {
    owner = "msfjarvis";
    repo = "file-collector";
    rev = "v${version}";
    sha256 = "sha256-r8BCz+3jbjiXqjApMnsy80W1EM9Ft4h9El7+rr1w0FI=";
  };

  buildFeatures = pkgs.lib.optionals stdenv.isLinux [ "journald" ];
  cargoSha256 = "sha256-mT4ebBdwTfK8oQMQv22FAtAlo1kR9P9eZ1CPA230/ew=";

  meta = with pkgs.lib; {
    description =
      "Simple CLI tool to watch directories and move their files to a single dumping ground";
    homepage = "https://msfjarvis.dev/g/file-collector";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
