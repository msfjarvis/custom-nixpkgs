{ stdenv, fetchFromGitHub, rustPlatform, pkgs ? import <nixpkgs> { } }:

rustPlatform.buildRustPackage rec {
  pname = "fclones";
  version = "0.9.1";
  # Tests are broken
  doCheck = false;

  src = fetchFromGitHub {
    owner = "pkolaczk";
    repo = "fclones";
    rev = "${version}";
    sha256 = "0lin6wl8bfh2rpjf3hqyz3kd85w2hrdfb5c8sim2zz2cg9q3a238";
  };

  nativeBuildInputs = [ pkgs.pkgconfig ];

  buildInputs = [ ] ++ pkgs.lib.optionals pkgs.stdenv.isLinux [ pkgs.libudev ]
    ++ pkgs.lib.optionals pkgs.stdenv.isDarwin [
      pkgs.darwin.apple_sdk.frameworks.AppKit
      pkgs.libiconv
    ];

  cargoSha256 = "1c2j0assq72wmksqavwzdwdny0m7dwrjj27p9q7f7lp4w7x8ppfz";

  meta = with pkgs.lib; {
    description = "Finds duplicate, unique, under- or over-replicated files";
    homepage = "https://github.com/pkolaczk/fclones";
    license = licenses.mit;
  };
}
