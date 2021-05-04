{ stdenv, fetchFromGitHub, rustPlatform, pkg-config, openssl
, pkgs ? import <nixpkgs> { } }:

rustPlatform.buildRustPackage rec {
  pname = "himalaya";
  version = "0.3.1";
  # Tests interact with the environment
  doCheck = false;

  src = fetchFromGitHub {
    owner = "soywod";
    repo = pname;
    rev = "v${version}";
    sha256 = "0m95gjdzh94vsbs7cdxlczk29m536acwlg4y55j7rz9cdcjfvzkj";
  };

  nativeBuildInputs = [ pkg-config ];
  buildInputs = [ openssl ] ++ pkgs.lib.optionals stdenv.isDarwin [
    pkgs.darwin.apple_sdk.frameworks.Security
    pkgs.libiconvReal
  ];

  cargoSha256 = "0bz91vs5i3qb8rd9yfajavb4lyp24cxmxalzkg2chii4ckr8d3ph";

  meta = with pkgs.lib; {
    description = "Minimalist CLI email client, written in Rust.";
    homepage = "https://github.com/soywod/himalaya";
    license = licenses.bsd3;
  };
}
