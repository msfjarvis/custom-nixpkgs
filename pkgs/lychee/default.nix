{ stdenv, fetchFromGitHub, rustPlatform, pkgs ? import <nixpkgs> { } }:

rustPlatform.buildRustPackage rec {
  pname = "lychee";
  version = "0.7.0";
  # Tests use network and are impure in nature
  doCheck = false;

  src = fetchFromGitHub {
    owner = "lycheeverse";
    repo = pname;
    rev = version;
    sha256 = "0kpwpbv0dqb0p4bxjlcjas6x1n91rdsvy2psrc1nyr1sh6gb1q5j";
  };

  nativeBuildInputs = [ pkgs.pkgconfig ];
  buildInputs = [ pkgs.openssl ] ++ pkgs.lib.optionals stdenv.isDarwin
    [ pkgs.darwin.apple_sdk.frameworks.Security pkgs.libiconvReal ];

  cargoSha256 = "1b915zkg41n3azk4hhg6fgc83n7iq8p7drvdyil2m2a4qdjvp9r3";

  meta = with pkgs.lib; {
    description = "A glorious link checker";
    homepage = "https://github.com/lycheeverse/lychee";
    license = licenses.mit;
  };
}
