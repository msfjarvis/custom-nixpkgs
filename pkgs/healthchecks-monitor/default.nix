{ stdenv, fetchFromGitHub, rustPlatform, pkg-config, openssl
, pkgs ? import <nixpkgs> { } }:

let
  mkRustPlatform = pkgs.callPackage ./../../lib/mk-rust-platform.nix { };

  rustPlatform = mkRustPlatform {
    date = "2021-08-21";
    channel = "nightly";
  };

in rustPlatform.buildRustPackage rec {
  pname = "healthchecks-monitor";
  version = "3.0.0";

  src = fetchFromGitHub {
    owner = "msfjarvis";
    repo = "healthchecks-rs";
    rev = "monitor-${version}";
    sha256 = "sha256-74kGwZCUgPS6RX5gfEWjPqCY8nsaTDB2tQAtL0tJoSM=";
  };

  nativeBuildInputs = [ pkg-config ];
  buildInputs = [ openssl ] ++ pkgs.lib.optionals stdenv.isDarwin [
    pkgs.darwin.apple_sdk.frameworks.Security
    pkgs.darwin.apple_sdk.frameworks.SystemConfiguration
    pkgs.libiconvReal
  ];

  buildAndTestSubdir = "monitor";

  cargoSha256 = "0lzrqrhbjn52vz6k1qsakn9d94py8fs1mqn7p4508nvhhly7wa9q";

  meta = with pkgs.lib; {
    description =
      "Simple CLI tool to keep a track of your https://healthchecks.io account";
    homepage = "https://msfjarvis.dev/g/healthchecks-rs";
    license = licenses.mit;
    platform = platforms.all;
  };
}
