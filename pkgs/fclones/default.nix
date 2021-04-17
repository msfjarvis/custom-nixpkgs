{ stdenv, fetchFromGitHub, rustPlatform, pkgs ? import <nixpkgs> { } }:

rustPlatform.buildRustPackage rec {
  pname = "fclones";
  version = "0.10.2";

  # Tests don't work on Darwin
  doCheck = !stdenv.isDarwin;

  src = fetchFromGitHub {
    owner = "pkolaczk";
    repo = pname;
    # Cargo.lock is out of sync on the tagged version
    # rev = "v${version}";
    rev = "7a98c6486ed997f928b4438b7449b0e01984ca63";
    sha256 = "0fh9wbf7v53fgmlyp5wxw4mr2j2zrb9gdzg0zi4bal8dd88mqc5g";
  };

  nativeBuildInputs = [ pkgs.pkgconfig ];

  buildInputs = [ ] ++ pkgs.lib.optionals pkgs.stdenv.isLinux [ pkgs.libudev ]
    ++ pkgs.lib.optionals pkgs.stdenv.isDarwin [
    pkgs.darwin.apple_sdk.frameworks.AppKit
    pkgs.libiconv
  ];

  cargoSha256 = "059705vl7f20kg771j7jr3igl96hgpid7v2hqihnnn7icl5gw8x7";

  meta = with pkgs.lib; {
    description = "Finds duplicate, unique, under- or over-replicated files";
    homepage = "https://github.com/pkolaczk/fclones";
    license = licenses.mit;
  };
}
