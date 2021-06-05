{ stdenv, fetchFromGitHub, rustPlatform, pkgs ? import <nixpkgs> { }, pkg-config
}:

rustPlatform.buildRustPackage rec {
  pname = "fclones";
  version = "0.12.0";

  # Tests don't work on Darwin
  doCheck = !stdenv.isDarwin;

  src = fetchFromGitHub {
    owner = "pkolaczk";
    repo = pname;
    rev = "v${version}";
    sha256 = "1x09jh4dsmpqc0hlh7pp0gdr4hclv2nza7pda9a5h2cbs5dkc7xn";
  };

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ ] ++ pkgs.lib.optionals pkgs.stdenv.isLinux [ pkgs.libudev ]
    ++ pkgs.lib.optionals pkgs.stdenv.isDarwin [
      pkgs.darwin.apple_sdk.frameworks.AppKit
      pkgs.libiconvReal
    ];

  cargoSha256 = "0gzdjs3kn22dzc2b8y74i2vjxwx3n4870j1bm2h7zxkkv9phl4iz";

  meta = with pkgs.lib; {
    description = "Efficient Duplicate File Finder";
    homepage = "https://github.com/pkolaczk/fclones";
    license = licenses.mit;
    platform = platforms.all;
  };
}
