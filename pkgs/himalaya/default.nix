{ stdenv, fetchFromGitHub, rustPlatform, pkg-config, openssl
, pkgs ? import <nixpkgs> { } }:

rustPlatform.buildRustPackage rec {
  pname = "himalaya";
  version = "0.4.0";
  # Tests interact with the environment
  doCheck = false;

  src = fetchFromGitHub {
    owner = "soywod";
    repo = pname;
    rev = "v${version}";
    sha256 = "05y615symvxzppby9683z01ffnr0inv02xlcy4jgpqjf5kyi6679";
  };

  nativeBuildInputs = [ pkg-config ];
  buildInputs = [ openssl ] ++ pkgs.lib.optionals stdenv.isDarwin [
    pkgs.darwin.apple_sdk.frameworks.Security
    pkgs.libiconvReal
  ];

  cargoSha256 = "1008a2ydrgk6amgqd7bwyn8nwi8vzsnrv8ahrqbd08bhn63qhjrl";

  meta = with pkgs.lib; {
    description = "Minimalist CLI email client, written in Rust.";
    homepage = "https://github.com/soywod/himalaya";
    license = licenses.bsd3;
    platform = platforms.all;
  };
}
