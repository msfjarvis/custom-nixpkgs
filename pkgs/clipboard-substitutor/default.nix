{ stdenv, fetchFromGitHub, rustPlatform, pkg-config, pkgs ? import <nixpkgs> { }
}:

let
  mkRustPlatform = pkgs.callPackage ./../../lib/mk-rust-platform.nix { };

  rustPlatform = mkRustPlatform {
    date = "2021-11-13";
    channel = "nightly";
  };

in rustPlatform.buildRustPackage rec {
  pname = "clipboard-substitutor";
  version = "0.1.0-alpha.1";

  src = fetchFromGitHub {
    owner = "msfjarvis";
    repo = "clipboard-substitutor";
    rev = "d425ae9133fe33253e05766de8cd879802cb50ab";
    sha256 = "sha256-+KAhVcpQc4MgHpeWQBVnbV0hofSJFzG5Ecq3BhiDUMc=";
  };

  cargoSha256 = "sha256-6jc7qXYila9amHC8dEC4iHJMpssezDdB3OFKupgZ4WE=";

  nativeBuildInputs = [ pkg-config pkgs.python3 ];
  buildInputs = [ ] ++ pkgs.lib.optionals stdenv.isLinux [ pkgs.xorg.libxcb ];

  meta = with pkgs.lib; {
    description =
      "CLI tool to monitor clipboard contents and perform actions based on a set of matchers";
    homepage = "https://msfjarvis.dev/g/clipboard-substitutor";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
