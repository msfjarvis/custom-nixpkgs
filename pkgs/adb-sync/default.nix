{ stdenv, fetchFromGitHub, pkgs ? import <nixpkgs> { } }:

stdenv.mkDerivation rec {
  pname = "adb-sync";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "msfjarvis";
    repo = pname;
    rev = "v${version}";
    sha256 = "0di7n6npziq37jz18k7kkiwhv1v3yphyhj0a3sjmx6p14rwjx0ms";
  };

  installPhase = ''
    install -m755 -D adb-sync $out/bin/adb-sync
    install -m755 -D adb-channel $out/bin/adb-channel
  '';

  meta = with pkgs.lib; {
    homepage = "https://github.com/google/adb-sync";
    description =
      "adb-sync is a tool to synchronize files between a PC and an Android device using the ADB (Android Debug Bridge)";
    license = licenses.asl20;
    platform = platforms.all;
  };
}
