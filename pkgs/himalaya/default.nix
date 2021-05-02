{ stdenv, fetchFromGitHub, rustPlatform, pkg-config, openssl
, pkgs ? import <nixpkgs> { } }:

rustPlatform.buildRustPackage rec {
  pname = "himalaya";
  version = "0.3.0";

  src = fetchFromGitHub {
    owner = "soywod";
    repo = pname;
    rev = "v${version}";
    sha256 = "1rhxbwzwplxg2wcdykkaf5cjl9npkqzllawab0wflb89xd51jr5k";
  };

  nativeBuildInputs = [ pkg-config ];
  buildInputs = [ openssl ] ++ pkgs.lib.optionals stdenv.isDarwin [
    pkgs.darwin.apple_sdk.frameworks.Security
    pkgs.libiconvReal
  ];

  cargoSha256 = "0rgr1kpprnipz6wjlfkbd9d18dypdrpqk01mi0cbi7j2psm4pmxv";

  meta = with pkgs.lib; {
    description = "Minimalist CLI email client, written in Rust.";
    homepage = "https://github.com/soywod/himalaya";
    license = licenses.bsd3;
  };
}
