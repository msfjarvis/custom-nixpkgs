{ stdenv, fetchFromGitHub, rustPlatform, pkg-config, openssl
, pkgs ? import <nixpkgs> { } }:

rustPlatform.buildRustPackage rec {
  pname = "healthchecks-monitor";
  version = "3.0.3";

  src = fetchFromGitHub {
    owner = "msfjarvis";
    repo = "healthchecks-rs";
    rev = "healthchecks-monitor-v${version}";
    sha256 = "sha256-KCV2AWdd3reh6B2ghnj/9yOtt+B38esuPk+aTnuXXNQ=";
  };

  nativeBuildInputs = [ pkg-config ];
  buildInputs = [ openssl ] ++ pkgs.lib.optionals stdenv.isDarwin
    [ pkgs.darwin.apple_sdk.frameworks.Security ];

  buildAndTestSubdir = "monitor";

  cargoSha256 = "sha256-Wrjsn7D4OplCRkAez+VFLd8CLsQNiQUEIUW1ZTrt+C4=";

  meta = with pkgs.lib; {
    description =
      "CLI tool to run shell jobs and report status to https://healthchecks.io";
    homepage = "https://msfjarvis.dev/g/healthchecks-rs";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
