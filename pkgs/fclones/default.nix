{ stdenv, fetchFromGitHub, rustPlatform, pkgs ? import <nixpkgs> { }, pkg-config
}:

rustPlatform.buildRustPackage rec {
  pname = "fclones";
  version = "0.12.2";

  # Tests don't work on Darwin
  doCheck = !stdenv.isDarwin;

  src = fetchFromGitHub {
    owner = "pkolaczk";
    repo = pname;
    rev = "v${version}";
    sha256 = "1mwb3rwijqaj30fb493bpkj7dd7pij342wwgfwl2x875y69jcw9c";
  };

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ ] ++ pkgs.lib.optionals pkgs.stdenv.isLinux [ pkgs.libudev ]
    ++ pkgs.lib.optionals pkgs.stdenv.isDarwin [
      pkgs.darwin.apple_sdk.frameworks.AppKit
      pkgs.libiconvReal
    ];

  cargoSha256 = "0x9xwha338yiwqxj10ajjy9jg4lkxnq5z0r5ngakh3qg7x42xxq9";

  meta = with pkgs.lib; {
    description = "Efficient Duplicate File Finder";
    homepage = "https://github.com/pkolaczk/fclones";
    license = licenses.mit;
    platform = platforms.all;
  };
}
