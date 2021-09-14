{ stdenv, fetchFromGitHub, rustPlatform, pkgs ? import <nixpkgs> { }, pkg-config
}:

rustPlatform.buildRustPackage rec {
  pname = "fclones";
  version = "0.15.0";
  # Checks fail on Darwin
  doCheck = !pkgs.stdenv.isDarwin;

  src = fetchFromGitHub {
    owner = "pkolaczk";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-8NUneKJpnBjC4OcAABEpI9p+saBqAk+l43FS8/tIYjc=";
  };

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ ] ++ pkgs.lib.optionals pkgs.stdenv.isLinux [ pkgs.libudev ]
    ++ pkgs.lib.optionals pkgs.stdenv.isDarwin [
      pkgs.darwin.apple_sdk.frameworks.AppKit
      pkgs.libiconvReal
    ];

  cargoSha256 = "sha256-5qX45FJFaiE1vTXjllM9U1w57MX18GgKEFOEBMc64Jk=";

  meta = with pkgs.lib; {
    description = "Efficient Duplicate File Finder";
    homepage = "https://github.com/pkolaczk/fclones";
    license = licenses.mit;
    platform = platforms.all;
  };
}
