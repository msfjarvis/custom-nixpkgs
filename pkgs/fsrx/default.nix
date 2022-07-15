{ stdenv, fetchFromGitHub, rustPlatform, pkgs ? import <nixpkgs> { } }:

rustPlatform.buildRustPackage rec {
  pname = "fsrx";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "coloradocolby";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-pKdxYO8Rhck3UYxqiWHDlrlPS4cAPe5jLUu5Dajop/k=";
  };

  cargoSha256 = "sha256-5h+ou9FLCG/WWMEQPsCTa1q+PovxUJs+6lzQ0L2bKIs=";

  meta = with pkgs.lib; {
    description = "📚 flow state reading in the terminal";
    homepage = "https://github.com/msfjarvis/androidx-release-watcher";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
