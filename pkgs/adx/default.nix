{ stdenv, fetchFromGitHub, mkRustPlatform, pkg-config
, pkgs ? import <nixpkgs> { } }:

mkRustPlatform.buildRustPackage rec {
  pname = "adx";
  version = "4.3.2";

  src = fetchFromGitHub {
    owner = "msfjarvis";
    repo = "adx";
    rev = "v${version}";
    sha256 = "sha256-636dIamJ5wP8n5A4shGWd9StMcbfvByEUkOjylfIWrc=";
  };

  nativeBuildInputs = [ pkg-config ];

  buildInputs = pkgs.lib.optionals stdenv.isDarwin
    [ pkgs.darwin.apple_sdk.frameworks.Security ]
    ++ pkgs.lib.optionals stdenv.isLinux [ pkgs.openssl ];

  cargoSha256 = "sha256-gv/4vbDPcsAyBC8TCdPdB7nICNZ6vMU8AgwX9TRE03U=";

  meta = with pkgs.lib; {
    description =
      "Rust binary that polls Google's Maven repository and extracts the latest version of all dependencies, with as few network calls as possible.";
    homepage = "https://github.com/msfjarvis/androidx-release-watcher";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
