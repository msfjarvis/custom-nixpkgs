{ stdenv, fetchFromGitHub, mkRustPlatform, openssl, pkg-config
, pkgs ? import <nixpkgs> { } }:

mkRustPlatform.buildRustPackage rec {
  pname = "hcctl";
  version = "2.0.1";

  src = fetchFromGitHub {
    owner = "msfjarvis";
    repo = "healthchecks-rs";
    rev = "hcctl-v${version}";
    sha256 = "sha256-RX4lmb/J6JUF7tS1iYz+ymanY9lt7BtPGHp9BrJqHmA=";
  };

  nativeBuildInputs = [ pkg-config ];
  buildInputs = [ openssl ] ++ pkgs.lib.optionals stdenv.isDarwin [
    pkgs.darwin.apple_sdk.frameworks.Security
    pkgs.darwin.apple_sdk.frameworks.SystemConfiguration
    pkgs.libiconvReal
  ];

  buildAndTestSubdir = "hcctl";

  cargoSha256 = "sha256-cuecWPP67AYrmch7DRW2ixvtAZLvChKTPhHI3PQMntE=";

  meta = with pkgs.lib; {
    description =
      "Simple CLI tool to keep a track of your https://healthchecks.io account";
    homepage = "https://msfjarvis.dev/g/healthchecks-rs";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
