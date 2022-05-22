{ stdenv, fetchFromGitHub, rustPlatform, openssl, pkg-config
, pkgs ? import <nixpkgs> { } }:

rustPlatform.buildRustPackage rec {
  pname = "healthchecks-monitor";
  version = "3.0.0";

  src = fetchFromGitHub {
    owner = "msfjarvis";
    repo = "healthchecks-rs";
    rev = "monitor-${version}";
    sha256 = "sha256-74kGwZCUgPS6RX5gfEWjPqCY8nsaTDB2tQAtL0tJoSM=";
  };

  nativeBuildInputs = [ pkg-config ];
  buildInputs = [ openssl ] ++ pkgs.lib.optionals stdenv.isDarwin
    [ pkgs.darwin.apple_sdk.frameworks.Security ];

  buildAndTestSubdir = "monitor";

  cargoSha256 = "0lzrqrhbjn52vz6k1qsakn9d94py8fs1mqn7p4508nvhhly7wa9q";

  meta = with pkgs.lib; {
    description =
      "CLI tool to run shell jobs and report status to https://healthchecks.io";
    homepage = "https://msfjarvis.dev/g/healthchecks-rs";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
