{ stdenv, fetchFromGitHub, rustPlatform, pkg-config, pkgs ? import <nixpkgs> { }
}:

rustPlatform.buildRustPackage rec {
  pname = "file-collector";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "msfjarvis";
    repo = "file-collector";
    rev = "v${version}";
    sha256 = "sha256-ABjd+QGgKJOy7OWcF/+5lTP+DontnC/5zwJqLAb98fM=";
  };

  cargoSha256 = "sha256-HGKtUwOm4hfDB2mKtfiMIWETqm/IC8bkfQrAXmVAKt0=";

  meta = with pkgs.lib; {
    description =
      "Simple CLI tool to watch directories and move their files to a single dumping ground";
    homepage = "https://msfjarvis.dev/g/file-collector";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
