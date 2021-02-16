{ stdenv, fetchFromGitHub, pkgs ? import <nixpkgs> { } }:

stdenv.mkDerivation rec {
  name = "adb-sync";
  version = "1.0.0";
  # I already fixed it in the source
  dontPatchShebangs = 1;

  src = fetchFromGitHub {
    owner = "msfjarvis";
    repo = "adb-sync";
    rev = "7cae4d11878a80b0d6d4d0072611cb5ea95be331";
    sha256 = "1m25mxihalzg94d7jjgc68xrffx7q9rv2cc6lj82b53n3wv63pqx";
  };

  installPhase = ''
    install -m755 -D adb-sync $out/bin/adb-sync
  '';

  meta = with pkgs.lib; {
    homepage = "https://github.com/google/adb-sync";
    description = "adb-sync is a tool to synchronize files between a PC and an Android device using the ADB (Android Debug Bridge)";
    platforms = platforms.linux;
  };
}
