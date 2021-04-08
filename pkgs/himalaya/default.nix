{ stdenv, fetchFromGitHub, rustPlatform, pkg-config, openssl
, pkgs ? import <nixpkgs> { } }:

rustPlatform.buildRustPackage rec {
  pname = "himalaya";
  version = "0.2.3";

  src = fetchFromGitHub {
    owner = "soywod";
    repo = "himalaya";
    rev = "v${version}";
    sha256 = "0wypc5v2ag31ccsp7b2397kv7zwv8ihmhmfy9r69a7vn4lwdi6hv";
  };

  nativeBuildInputs = [ pkg-config ];
  buildInputs = [ openssl ] ++ pkgs.lib.optionals stdenv.isDarwin [
    pkgs.darwin.apple_sdk.frameworks.Security
    pkgs.libiconv
  ];

  cargoSha256 = "0kf4wljmjnxpy757myhnr5qqcqwvqwm0fq3l7nqyisks96v1facm";

  meta = with pkgs.lib; {
    description = "Minimalist CLI email client, written in Rust.";
    homepage = "https://github.com/soywod/himalaya";
    license = licenses.bsd3;
  };
}
