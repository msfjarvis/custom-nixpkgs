{ stdenv, fetchFromGitHub, pkg-config, pkgs ? import <nixpkgs> { }
, mkRustPlatform }:

mkRustPlatform.buildRustPackage rec {
  pname = "clipboard-substitutor";
  version = "0.4.1";

  src = fetchFromGitHub {
    owner = "msfjarvis";
    repo = "clipboard-substitutor";
    rev = "v${version}";
    sha256 = "sha256-ntnx4ROkkBBFj4UEnd4ER1RyYkOlcZxu9+widfNTBro=";
  };

  cargoSha256 = "sha256-ablp6TgPnZy47dMBbT//KBXq3lE0Q69CbmL4XLi67XE=";

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
