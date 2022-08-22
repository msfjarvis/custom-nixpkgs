{ stdenv, fetchFromGitHub, rustPlatform, pkg-config, openssl
, pkgs ? import <nixpkgs> { } }:

rustPlatform.buildRustPackage rec {
  pname = "hcctl";
  version = "2.0.4";

  src = fetchFromGitHub {
    owner = "msfjarvis";
    repo = "healthchecks-rs";
    rev = "hcctl-v${version}";
    sha256 = "sha256-7rNr3PCS7JKhYwqXU2a6CZune41/6m3U8eXKFzl76JY=";
  };

  nativeBuildInputs = [ pkg-config ];
  buildInputs = [ openssl ] ++ pkgs.lib.optionals stdenv.isDarwin
    [ pkgs.darwin.apple_sdk.frameworks.Security ];

  buildAndTestSubdir = "hcctl";

  cargoSha256 = "sha256-wiDbUTXvfgN+3hr/GOdIB+9BAgiWEGSW41CM2mP2urg=";

  meta = with pkgs.lib; {
    description =
      "Simple CLI tool to keep a track of your https://healthchecks.io account";
    homepage = "https://msfjarvis.dev/g/healthchecks-rs";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
