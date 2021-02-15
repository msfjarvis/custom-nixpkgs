{ stdenv, fetchFromGitHub, rustPlatform, pkgs ? import <nixpkgs> { } }:

rustPlatform.buildRustPackage rec {
  pname = "lychee";
  version = "0.4.1";
  # Tests use network and are impure in nature
  doCheck = false;

  src = fetchFromGitHub {
    owner = "lycheeverse";
    repo = "lychee";
    rev = "v${version}";
    sha256 = "08accjk7lsab8qg2f8nmi8f6h7gncs4b090yv2sca456f6yavnhq";
  };

  nativeBuildInputs = [ pkgs.pkgconfig ];
  buildInputs = [ pkgs.openssl ];

  cargoSha256 = "01m5zvcrc3yc8kwnbp59lgc9nj06pxsxx6i3gaqmh9ah587m7rm6";

  meta = with pkgs.lib; {
    description = "A glorious link checker";
    homepage = "https://github.com/lycheeverse/lychee";
    license = licenses.mit;
    platforms = platforms.unix;
  };
}
