{ stdenv, fetchFromGitHub, rustPlatform, pkgs ? import <nixpkgs> { }, pkg-config
}:

let
  mkRustPlatform = pkgs.callPackage ./../../lib/mk-rust-platform.nix { };

  rustPlatform = mkRustPlatform {
    date = "2021-08-21";
    channel = "nightly";
  };

in rustPlatform.buildRustPackage rec {
  pname = "rust-script";
  version = "0.17.0";
  # Tests don't work
  doCheck = false;

  src = fetchFromGitHub {
    owner = "fornwall";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-o6fq4/U+sJgfpKnJ2CdVhhtOdb32mgY5goWFQTeF6Es=";
  };

  nativeBuildInputs = [ pkg-config ];

  cargoSha256 = "sha256-hg0QtxR1qm/x8G6HoN7xAyOwh9jiQvX2wWYjUR8YvMs=";

  buildInputs = [ ] ++ pkgs.lib.optionals stdenv.isDarwin [
    pkgs.darwin.apple_sdk.frameworks.Security
    pkgs.darwin.apple_sdk.frameworks.SystemConfiguration
    pkgs.libiconvReal
  ];

  meta = with pkgs.lib; {
    description =
      ''Command-line tool to run Rust "scripts" which can make use of crates.'';
    homepage = "https://rust-script.org/";
    license = licenses.mit;
    platform = platforms.all;
  };
}
