{ lib, stdenv, fetchFromGitHub, rustPlatform, pkgs ? import <nixpkgs> { } }:

rustPlatform.buildRustPackage rec {
  pname = "prs";
  version = "0.2.4";

  src = fetchFromGitHub {
    owner = "timvisee";
    repo = "prs";
    rev = "v${version}";
    sha256 = "1z0f84ayb2i8aj9ziqghmx24qyyzk0wf772kcslnmi3ijz4i5cpj";
  };

  nativeBuildInputs = [ pkgs.python3Full pkgs.pkgconfig ];

  buildInputs = [
    pkgs.atk
    pkgs.cairo
    pkgs.gdk-pixbuf
    pkgs.glib
    pkgs.gnome3.gtk3
    pkgs.pango
    pkgs.xorg.libxcb
  ] ++ pkgs.lib.optionals stdenv.isDarwin
    [ pkgs.darwin.apple_sdk.frameworks.Security ];

  buildPhase = ''
    cargo build -p prs-cli
  '';

  cargoSha256 = "0mdmf5v86cmgqvm2440vjflngy6imbdw3wiiixn1dg2kwgm2c5mk";

  meta = with pkgs.lib; {
    description =
      "A secure, fast & convenient password manager CLI using GPG and git to sync.";
    homepage = "https://gitlab.com/timvisee/prs";
    license = licenses.gpl3;
  };
}
