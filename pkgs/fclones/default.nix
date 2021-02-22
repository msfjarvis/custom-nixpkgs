{ stdenv, fetchFromGitHub, rustPlatform, pkgs ? import <nixpkgs> { } }:

rustPlatform.buildRustPackage rec {
  pname = "fclones";
  version = "0.8.0";
  # Tests are broken
  doCheck = false;

  src = fetchFromGitHub {
    owner = "msfjarvis";
    repo = "fclones";
    rev = "7c30e1fc9be382f54f06140608b6416c9b7eb6d1";
    sha256 = "1nrx41js515zixnbpfbgw3r9a6wk66ipamwlqv64v6yr1czz0zxq";
  };

  nativeBuildInputs = [ pkgs.pkgconfig ];

  buildInputs = [ pkgs.libudev ];

  cargoSha256 = "09yf0cqf9qg46nr3wcz4kz9lk7m5vdbrkhi75qq8bscfgcvgx0q6";

  meta = with pkgs.lib; {
    description = "Finds duplicate, unique, under- or over-replicated files";
    homepage = "https://github.com/pkolaczk/fclones";
    license = licenses.mit;
  };
}
