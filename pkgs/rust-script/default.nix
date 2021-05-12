{ stdenv, fetchFromGitHub, rustPlatform, pkgs ? import <nixpkgs> { }, pkg-config
}:

rustPlatform.buildRustPackage rec {
  pname = "rust-script";
  version = "0.14.0";
  # Tests don't work
  doCheck = false;

  src = fetchFromGitHub {
    owner = "fornwall";
    repo = pname;
    rev = "v${version}";
    sha256 = "03yam0lmwa11nr46jrhlfgvf63zr3wvlh79lzc9ar6425v0spk3l";
  };

  nativeBuildInputs = [ pkg-config ];

  cargoSha256 = "1rbal1sjplb3lj3yn0kfnx7alpwfj8c4hib63azq2s656g02i6vr";

  buildInputs = [ ] ++ pkgs.lib.optionals stdenv.isDarwin [
    pkgs.darwin.apple_sdk.frameworks.Security
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
