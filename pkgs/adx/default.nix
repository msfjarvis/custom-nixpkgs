{ stdenv, fetchFromGitHub, rustPlatform, pkgs ? import <nixpkgs> { }, pkg-config
}:

let
  mkRustPlatform = pkgs.callPackage ./../../lib/mk-rust-platform.nix { };

  rustPlatform = mkRustPlatform {
    date = "2021-08-21";
    channel = "nightly";
  };

in rustPlatform.buildRustPackage rec {
  pname = "adx";
  version = "4.0.1-alpha.3";

  src = fetchFromGitHub {
    owner = "msfjarvis";
    repo = "androidx-release-watcher";
    rev = "v${version}";
    sha256 = "sha256-HSn5Fe6r+UOx9BWIB8cHcslKMwZgZnUz42eNIc6miHo=";
  };

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ ] ++ pkgs.lib.optionals stdenv.isDarwin [
    pkgs.darwin.apple_sdk.frameworks.Security
    pkgs.darwin.apple_sdk.frameworks.SystemConfiguration
    pkgs.libiconvReal
  ] ++ pkgs.lib.optionals stdenv.isLinux [ pkgs.openssl ];

  cargoSha256 = "sha256-nJGuj8FOXTxoCjoN7zgKP8kU5U7MWhJy+OGVHzdFKKM=";

  meta = with pkgs.lib; {
    description =
      "Rust binary that polls Google's Maven repository and extracts the latest version of all dependencies, with as few network calls as possible.";
    homepage = "https://github.com/msfjarvis/androidx-release-watcher";
    license = licenses.mit;
    platform = platforms.all;
  };
}
