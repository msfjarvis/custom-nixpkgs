{ stdenv, fetchFromGitHub, pkg-config, mkRustPlatform
, pkgs ? import <nixpkgs> { } }:

mkRustPlatform.buildRustPackage rec {
  pname = "jless";
  version = "0.8.0";

  src = fetchFromGitHub {
    owner = "PaulJuliusMartinez";
    repo = "jless";
    rev = "v${version}";
    sha256 = "sha256-NB/s29M46mVhTsJWFYnBgJjSjUVbfdmuz69VdpVuR7c=";
  };

  cargoSha256 = "sha256-cPj9cTRhWK/YU8Cae63p4Vm5ohB1IfGL5fu7yyFGSXA=";

  nativeBuildInputs = [ pkg-config pkgs.python3 ];
  buildInputs = pkgs.lib.optionals stdenv.isDarwin
    [ pkgs.darwin.apple_sdk.frameworks.AppKit ]
    ++ pkgs.lib.optionals stdenv.isLinux [ pkgs.xorg.libxcb ];

  meta = with pkgs.lib; {
    description = "A command-line pager for JSON data.";
    homepage = "https://pauljuliusmartinez.github.io/";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
