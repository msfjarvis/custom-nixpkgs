{ stdenv, fetchFromGitHub, rustPlatform, pkgs ? import <nixpkgs> { } }:

rustPlatform.buildRustPackage rec {
  pname = "lurk";
  version = "0.0.7";

  src = fetchFromGitHub {
    owner = "JakWai01";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-fJqDnkPbQE2upkrnckkJCq2zFJ3nNgCurW8ipCFvuzI=";
  };

  cargoSha256 = "sha256-BRwY/FeXdIEietT3iTlRKGLMt6TddMiS/HLT2EMOPMM=";

  meta = with pkgs.lib; {
    description = "A pretty (simple) alternative to strace";
    homepage = "https://github.com/JakWai01/lurk";
    license = licenses.agpl3Only;
    platforms = platforms.linux;
  };
}
