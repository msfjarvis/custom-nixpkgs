{ lib, stdenv, fetchFromGitHub, rustPlatform, pkgs ? import <nixpkgs> { } }:

rustPlatform.buildRustPackage rec {
  pname = "prs";
  version = "0.2.7";

  src = fetchFromGitHub {
    owner = "timvisee";
    repo = "prs";
    rev = "v${version}";
    sha256 = "1vsjp5axpznsaga4k75820xaifa3ga04195fvqqlvshnjmzy16nl";
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

  installPhase = ''
    mkdir -p $out/bin
    find . -type f -name prs | xargs -I {} cp -v {} $out/bin/
    chmod +x $out/bin/prs
  '';

  cargoSha256 = "1fd72ypdf4fj66afq0hf65dznx37vgbw29g0jzmylyl6yddlnyip";

  meta = with pkgs.lib; {
    description =
      "A secure, fast & convenient password manager CLI using GPG and git to sync.";
    homepage = "https://gitlab.com/timvisee/prs";
    license = licenses.gpl3;
  };
}
