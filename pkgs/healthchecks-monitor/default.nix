{ stdenv, fetchFromGitHub, rustPlatform, pkg-config, openssl
, pkgs ? import <nixpkgs> { } }:

rustPlatform.buildRustPackage rec {
  pname = "healthchecks-monitor";
  version = "3.0.1";

  src = fetchFromGitHub {
    owner = "msfjarvis";
    repo = "healthchecks-rs";
    rev = "healthchecks-monitor-v${version}";
    sha256 = "sha256-tsWy5WdhWB2OtdtgOsVpOK6kvCgfuQsJ7QnKeVu1ACc=";
  };

  nativeBuildInputs = [ pkg-config ];
  buildInputs = [ openssl ] ++ pkgs.lib.optionals stdenv.isDarwin
    [ pkgs.darwin.apple_sdk.frameworks.Security ];

  buildAndTestSubdir = "monitor";

  cargoSha256 = "sha256-smuHJYKY/RiNUN425jTIJMlxYqA9LJdAA5PsJIoMmlg=";

  meta = with pkgs.lib; {
    description =
      "CLI tool to run shell jobs and report status to https://healthchecks.io";
    homepage = "https://msfjarvis.dev/g/healthchecks-rs";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
