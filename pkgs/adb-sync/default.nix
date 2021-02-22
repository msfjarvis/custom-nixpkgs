{ stdenv, fetchFromGitHub, pkgs ? import <nixpkgs> { } }:

stdenv.mkDerivation rec {
  name = "adb-sync";
  version = "1.0.0";
  # I already fixed it in the source
  dontPatchShebangs = 1;

  src = fetchFromGitHub {
    owner = "msfjarvis";
    repo = "adb-sync";
    rev = "2afb0aac3f973a905917fe9e0cf4cb144772e08f";
    sha256 = "0di7n6npziq37jz18k7kkiwhv1v3yphyhj0a3sjmx6p14rwjx0ms";
  };

  installPhase = ''
    install -m755 -D adb-sync $out/bin/adb-sync
  '';

  meta = with pkgs.lib; {
    homepage = "https://github.com/google/adb-sync";
    description =
      "adb-sync is a tool to synchronize files between a PC and an Android device using the ADB (Android Debug Bridge)";
  };
}
