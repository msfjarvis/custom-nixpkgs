{ stdenv, fetchFromGitHub, mkRustPlatform, pkg-config
, pkgs ? import <nixpkgs> { } }:

mkRustPlatform.buildRustPackage rec {
  pname = "adx";
  version = "4.2.0";

  src = fetchFromGitHub {
    owner = "msfjarvis";
    repo = "androidx-release-watcher";
    rev = "v${version}";
    sha256 = "sha256-UfxVKkTiydtey6vhRa3sQ0Hz0TKA4eKgDJqw5aDL1L8=";
  };

  nativeBuildInputs = [ pkg-config ];

  buildInputs = pkgs.lib.optionals stdenv.isDarwin [
    pkgs.darwin.apple_sdk.frameworks.Security
    pkgs.darwin.apple_sdk.frameworks.SystemConfiguration
    pkgs.libiconvReal
  ] ++ pkgs.lib.optionals stdenv.isLinux [ pkgs.openssl ];

  cargoSha256 = "sha256-U2r/bHT/W9cwkza1L8s/Tqv3DCgxwTwtok3+lU7zkCQ=";

  meta = with pkgs.lib; {
    description =
      "Rust binary that polls Google's Maven repository and extracts the latest version of all dependencies, with as few network calls as possible.";
    homepage = "https://github.com/msfjarvis/androidx-release-watcher";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
