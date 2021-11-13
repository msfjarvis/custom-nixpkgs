{ stdenv, fetchFromGitHub, rustPlatform, pkgs ? import <nixpkgs> { }, pkg-config
}:

let
  mkRustPlatform = pkgs.callPackage ./../../lib/mk-rust-platform.nix { };

  rustPlatform = mkRustPlatform {
    date = "2021-11-13";
    channel = "nightly";
  };

in rustPlatform.buildRustPackage rec {
  pname = "adx";
  version = "4.1.0";

  src = fetchFromGitHub {
    owner = "msfjarvis";
    repo = "androidx-release-watcher";
    rev = "v${version}";
    sha256 = "sha256-KG990Wcbb7EYaZkKnS3r5VVvEyNEU/0FQKUdSffhisc=";
  };

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ ] ++ pkgs.lib.optionals stdenv.isDarwin [
    pkgs.darwin.apple_sdk.frameworks.Security
    pkgs.darwin.apple_sdk.frameworks.SystemConfiguration
    pkgs.libiconvReal
  ] ++ pkgs.lib.optionals stdenv.isLinux [ pkgs.openssl ];

  cargoSha256 = "sha256-QgjfL8fzZhFfx2XWPq/N9Fax8Tv+6SGE8JBprbLWggo=";

  meta = with pkgs.lib; {
    description =
      "Rust binary that polls Google's Maven repository and extracts the latest version of all dependencies, with as few network calls as possible.";
    homepage = "https://github.com/msfjarvis/androidx-release-watcher";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
