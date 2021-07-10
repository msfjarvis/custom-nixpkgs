{ stdenv, fetchFromGitHub, rustPlatform, pkgs ? import <nixpkgs> { }, pkg-config
}:

rustPlatform.buildRustPackage rec {
  pname = "rust-script";
  version = "0.15.0";
  # Tests don't work
  doCheck = false;

  src = fetchFromGitHub {
    owner = "fornwall";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-4j7BtN4hGUV/VICbjAdV9McUQo0hZwyIQYB2Ez1O9h0=";
  };

  nativeBuildInputs = [ pkg-config ];

  cargoSha256 = "sha256-BPj/FndpAc+nSmqodN7XOl8YU/OUIfKQY6UPqZT1baw=";

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
