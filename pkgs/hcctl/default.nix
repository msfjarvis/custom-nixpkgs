{ stdenv, fetchFromGitHub, mkRustPlatform, openssl, pkg-config
, pkgs ? import <nixpkgs> { } }:

mkRustPlatform.buildRustPackage rec {
  pname = "hcctl";
  version = "2.0.2";

  src = fetchFromGitHub {
    owner = "msfjarvis";
    repo = "healthchecks-rs";
    rev = "hcctl-v${version}";
    sha256 = "sha256-EX7LlDFdUwYMih2CS9EdkDmnVqhB4rQd6iFRlbFTsUU=";
  };

  nativeBuildInputs = [ pkg-config ];
  buildInputs = [ openssl ] ++ pkgs.lib.optionals stdenv.isDarwin
    [ pkgs.darwin.apple_sdk.frameworks.Security ];

  buildAndTestSubdir = "hcctl";

  cargoSha256 = "sha256-dx9WgFAuFCvRuz9PjLu1BRB7M3HndIda1lplljcM+Nw=";

  meta = with pkgs.lib; {
    description =
      "Simple CLI tool to keep a track of your https://healthchecks.io account";
    homepage = "https://msfjarvis.dev/g/healthchecks-rs";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
