{ stdenv, fetchFromGitHub, rustPlatform, pkg-config, openssl
, pkgs ? import <nixpkgs> { } }:

rustPlatform.buildRustPackage rec {
  pname = "hcctl";
  version = "2.0.3";

  src = fetchFromGitHub {
    owner = "msfjarvis";
    repo = "healthchecks-rs";
    rev = "hcctl-v${version}";
    sha256 = "sha256-mZWvplk/5UYzsKkOzc6EUyjC+3o8Scfdj/enXXZvqGg=";
  };

  nativeBuildInputs = [ pkg-config ];
  buildInputs = [ openssl ] ++ pkgs.lib.optionals stdenv.isDarwin
    [ pkgs.darwin.apple_sdk.frameworks.Security ];

  buildAndTestSubdir = "hcctl";

  cargoSha256 = "sha256-sa222iT7A9dvHWKh9vSiVZtfQxdkFt0wci34Ta2XtaI=";

  meta = with pkgs.lib; {
    description =
      "Simple CLI tool to keep a track of your https://healthchecks.io account";
    homepage = "https://msfjarvis.dev/g/healthchecks-rs";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
