{ stdenv, fetchFromGitHub, rustPlatform, pkgs ? import <nixpkgs> { } }:

rustPlatform.buildRustPackage rec {
  pname = "lurk";
  version = "0.2.9";

  src = fetchFromGitHub {
    owner = "JakWai01";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-Vvz1CWNpMbVpICL42VQHLM7AWSONGSXP5kfZ8rZlw8M=";
  };

  cargoSha256 = "sha256-AoFkgm13vj/18GOuSIgzs+xk82lSQ6zGpq4QVWcClv8=";

  meta = with pkgs.lib; {
    description = "A pretty (simple) alternative to strace";
    homepage = "https://github.com/JakWai01/lurk";
    license = licenses.agpl3Only;
    platforms = platforms.linux;
  };
}
