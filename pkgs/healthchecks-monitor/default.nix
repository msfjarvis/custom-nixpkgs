{ stdenv, fetchFromGitHub, rustPlatform, pkg-config, openssl
, pkgs ? import <nixpkgs> { } }:

rustPlatform.buildRustPackage rec {
  pname = "healthchecks-monitor";
  version = "3.0.2";

  src = fetchFromGitHub {
    owner = "msfjarvis";
    repo = "healthchecks-rs";
    rev = "healthchecks-monitor-v${version}";
    sha256 = "sha256-7rNr3PCS7JKhYwqXU2a6CZune41/6m3U8eXKFzl76JY=";
  };

  nativeBuildInputs = [ pkg-config ];
  buildInputs = [ openssl ] ++ pkgs.lib.optionals stdenv.isDarwin
    [ pkgs.darwin.apple_sdk.frameworks.Security ];

  buildAndTestSubdir = "monitor";

  cargoSha256 = "sha256-On9VvowxP8tdPTEjmu1sjnvy8Aw0WonX0czI016uqjs=";

  meta = with pkgs.lib; {
    description =
      "CLI tool to run shell jobs and report status to https://healthchecks.io";
    homepage = "https://msfjarvis.dev/g/healthchecks-rs";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
