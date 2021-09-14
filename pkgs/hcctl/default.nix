{ stdenv, fetchFromGitHub, rustPlatform, pkg-config, openssl
, pkgs ? import <nixpkgs> { } }:

let
  mkRustPlatform = pkgs.callPackage ./../../lib/mk-rust-platform.nix { };

  rustPlatform = mkRustPlatform {
    date = "2021-08-21";
    channel = "nightly";
  };

in rustPlatform.buildRustPackage rec {
  pname = "hcctl";
  version = "2.0.0";

  src = fetchFromGitHub {
    owner = "msfjarvis";
    repo = "healthchecks-rs";
    rev = "hcctl-${version}";
    sha256 = "sha256-2bK4ACGH/rOr8bDNP+jGXWw8JfkSa1oMwhD81U7D5uQ=";
  };

  nativeBuildInputs = [ pkg-config ];
  buildInputs = [ openssl ] ++ pkgs.lib.optionals stdenv.isDarwin [
    pkgs.darwin.apple_sdk.frameworks.Security
    pkgs.darwin.apple_sdk.frameworks.SystemConfiguration
    pkgs.libiconvReal
  ];

  buildAndTestSubdir = "hcctl";

  cargoSha256 = "sha256-8h1jFB9hAlJjk4pQZrc3LbmKdCziSUAwDtHGN4tTAQw=";

  meta = with pkgs.lib; {
    description =
      "Simple CLI tool to keep a track of your https://healthchecks.io account";
    homepage = "https://msfjarvis.dev/g/healthchecks-rs";
    license = licenses.mit;
    platform = platforms.all;
  };
}
