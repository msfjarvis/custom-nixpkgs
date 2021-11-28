{ stdenv, fetchFromGitHub, pkg-config, pkgs ? import <nixpkgs> { }
, mkRustPlatform }:

mkRustPlatform.buildRustPackage rec {
  pname = "clipboard-substitutor";
  version = "0.2.0";

  src = fetchFromGitHub {
    owner = "msfjarvis";
    repo = "clipboard-substitutor";
    rev = "d425ae9133fe33253e05766de8cd879802cb50ab";
    sha256 = "sha256-+KAhVcpQc4MgHpeWQBVnbV0hofSJFzG5Ecq3BhiDUMc=";
  };

  cargoSha256 = "sha256-5A4Fpe0zgJPn5KkQ7SNZvP8WWGexnCE4FDoQipMaXlw=";

  nativeBuildInputs = [ pkg-config pkgs.python3 ];
  buildInputs = pkgs.lib.optionals stdenv.isLinux [ pkgs.xorg.libxcb ]
    ++ pkgs.lib.optionals stdenv.isDarwin
    [ pkgs.darwin.apple_sdk.frameworks.AppKit ];

  meta = with pkgs.lib; {
    description =
      "CLI tool to monitor clipboard contents and perform actions based on a set of matchers";
    homepage = "https://msfjarvis.dev/g/clipboard-substitutor";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
