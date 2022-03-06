{ stdenv, fetchFromGitHub, pkg-config, pkgs ? import <nixpkgs> { }
, mkRustPlatform }:

mkRustPlatform.buildRustPackage rec {
  pname = "clipboard-substitutor";
  version = "0.4.4";

  src = fetchFromGitHub {
    owner = "msfjarvis";
    repo = "clipboard-substitutor";
    rev = "v${version}";
    sha256 = "sha256-LaQn9et8Vi0OLJ9aflotS8kb3oM7B927kEHQtkSztCo=";
  };

  cargoSha256 = "sha256-sJamc7MkqvmZN8jcnYJObcXAOHuX5ENPh/tnle620Zo=";

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
