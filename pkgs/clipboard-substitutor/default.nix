{ stdenv, fetchFromGitHub, pkg-config, pkgs ? import <nixpkgs> { }
, mkRustPlatform }:

mkRustPlatform.buildRustPackage rec {
  pname = "clipboard-substitutor";
  version = "0.4.3";

  src = fetchFromGitHub {
    owner = "msfjarvis";
    repo = "clipboard-substitutor";
    rev = "v${version}";
    sha256 = "sha256-TLqtZL5XY0+aOCJJHRijs0WPE6HQbjk2OxbFBewQmCE=";
  };

  cargoSha256 = "sha256-4bJQ2KwnI7mqDc/P60XGfJnL+n8TK4hS5EN2PGAaPqA=";

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
