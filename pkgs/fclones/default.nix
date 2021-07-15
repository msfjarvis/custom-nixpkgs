{ stdenv, fetchFromGitHub, rustPlatform, pkgs ? import <nixpkgs> { }, pkg-config
}:

rustPlatform.buildRustPackage rec {
  pname = "fclones";
  version = "0.12.3";

  # Tests don't work on Darwin
  doCheck = !stdenv.isDarwin;

  src = fetchFromGitHub {
    owner = "pkolaczk";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-Gy9+rg9wxrQEWvn6LZOL1g3Nc61lLGHprW4YuvEcZwI=";
  };

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ ] ++ pkgs.lib.optionals pkgs.stdenv.isLinux [ pkgs.libudev ]
    ++ pkgs.lib.optionals pkgs.stdenv.isDarwin [
      pkgs.darwin.apple_sdk.frameworks.AppKit
      pkgs.libiconvReal
    ];

  cargoSha256 = "sha256-5QvKNxpY/8uKGJRD0hBNQPWlEwFBQoC/Xs4CUqactAM=";

  meta = with pkgs.lib; {
    description = "Efficient Duplicate File Finder";
    homepage = "https://github.com/pkolaczk/fclones";
    license = licenses.mit;
    platform = platforms.all;
  };
}
