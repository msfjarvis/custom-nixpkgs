{ stdenv, fetchFromGitHub, rustPlatform, pkgs ? import <nixpkgs> { } }:

rustPlatform.buildRustPackage rec {
  pname = "fclones";
  version = "0.10.1";

  src = fetchFromGitHub {
    owner = "pkolaczk";
    repo = "fclones";
    rev = "v${version}";
    sha256 = "0y5i617j88v3s0bjdaqdgix3zap3l34bkj3186aiv1gs2v0j10qg";
  };

  nativeBuildInputs = [ pkgs.pkgconfig ];

  buildInputs = [ ] ++ pkgs.lib.optionals pkgs.stdenv.isLinux [ pkgs.libudev ]
    ++ pkgs.lib.optionals pkgs.stdenv.isDarwin [
    pkgs.darwin.apple_sdk.frameworks.AppKit
    pkgs.libiconv
  ];

  cargoSha256 = "17r9iay5yd3vvdc2wvn91z2z7nblk723gl8gzw66mkk4zw84adcz";

  meta = with pkgs.lib; {
    description = "Finds duplicate, unique, under- or over-replicated files";
    homepage = "https://github.com/pkolaczk/fclones";
    license = licenses.mit;
  };
}
