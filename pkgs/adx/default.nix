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
  version = "4.0.0";

  src = fetchFromGitHub {
    owner = "msfjarvis";
    repo = "androidx-release-watcher";
    rev = "v${version}";
    sha256 = "sha256-ov/0GjIMl/eQW4GMx4mCjjOpnefxL2U8vrEqXD62iHk=";
  };

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ ] ++ pkgs.lib.optionals stdenv.isDarwin [
    pkgs.darwin.apple_sdk.frameworks.Security
    pkgs.darwin.apple_sdk.frameworks.SystemConfiguration
    pkgs.libiconvReal
  ] ++ pkgs.lib.optionals stdenv.isLinux [ pkgs.openssl ];

  cargoSha256 = "sha256-3moSyjjqmMl6J8TvPRWG0XDvoYmM16jJml+15l2daag=";

  meta = with pkgs.lib; {
    description =
      "Rust binary that polls Google's Maven repository and extracts the latest version of all dependencies, with as few network calls as possible.";
    homepage = "https://github.com/msfjarvis/androidx-release-watcher";
    license = licenses.mit;
    platform = platforms.all;
  };
}
