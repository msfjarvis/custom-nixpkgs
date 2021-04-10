{ stdenv, fetchFromGitHub, rustPlatform, pkgs ? import <nixpkgs> { } }:

rustPlatform.buildRustPackage rec {
  pname = "lychee";
  version = "0.5.1-alpha";
  # Tests use network and are impure in nature
  doCheck = false;

  src = fetchFromGitHub {
    owner = "lycheeverse";
    repo = "lychee";
    rev = "v${version}";
    sha256 = "1k9fyrzqnbqcik6yvy4rl0jbci3db3b8nxc16ap79181bq79n87v";
  };

  nativeBuildInputs = [ pkgs.pkgconfig ];
  buildInputs = [ pkgs.openssl ] ++ pkgs.lib.optionals stdenv.isDarwin
    [ pkgs.darwin.apple_sdk.frameworks.Security ];

  cargoSha256 = "1jy49rn0108qa4xq90sbp61jzf4k6jh2b54pnwhmliz849w3qgvc";

  meta = with pkgs.lib; {
    description = "A glorious link checker";
    homepage = "https://github.com/lycheeverse/lychee";
    license = licenses.mit;
  };
}
