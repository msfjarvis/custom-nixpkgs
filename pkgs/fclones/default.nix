{ stdenv, fetchFromGitHub, rustPlatform, pkgs ? import <nixpkgs> { }, pkg-config
}:

rustPlatform.buildRustPackage rec {
  pname = "fclones";
  version = "0.11.0";

  # Tests don't work on Darwin
  doCheck = !stdenv.isDarwin;

  src = fetchFromGitHub {
    owner = "pkolaczk";
    repo = pname;
    rev = "v${version}";
    sha256 = "0008xqb47cmiyxng7yidzfgl6frd0dqa1nj9gk20770x8hwf1shk";
  };

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ ] ++ pkgs.lib.optionals pkgs.stdenv.isLinux [ pkgs.libudev ]
    ++ pkgs.lib.optionals pkgs.stdenv.isDarwin [
      pkgs.darwin.apple_sdk.frameworks.AppKit
      pkgs.libiconv
    ];

  cargoSha256 = "1icz7xg7zn5v0l0f7cy4h2zxzpl872pnfjda1m1zp3p0v478slli";

  meta = with pkgs.lib; {
    description = "Efficient Duplicate File Finder";
    homepage = "https://github.com/pkolaczk/fclones";
    license = licenses.mit;
  };
}
