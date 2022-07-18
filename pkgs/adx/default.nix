{ stdenv, fetchFromGitHub, rustPlatform, pkgs ? import <nixpkgs> { } }:

rustPlatform.buildRustPackage rec {
  pname = "adx";
  version = "4.3.3";

  src = fetchFromGitHub {
    owner = "msfjarvis";
    repo = "adx";
    rev = "v${version}";
    sha256 = "sha256-4XgypEgjqyawVHHjJjflzLb+Tm4oon6D815JSSTz4pU=";
  };

  buildInputs = pkgs.lib.optionals stdenv.isDarwin
    [ pkgs.darwin.apple_sdk.frameworks.Security ];

  cargoSha256 = "sha256-0In78YoaVmkbueoNYzgPyvNKHT5KcmFd0dZwwQ+Ucig=";

  meta = with pkgs.lib; {
    description =
      "Rust binary that polls Google's Maven repository and extracts the latest version of all dependencies, with as few network calls as possible.";
    homepage = "https://github.com/msfjarvis/androidx-release-watcher";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
