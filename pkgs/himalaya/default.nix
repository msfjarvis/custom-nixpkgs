{ stdenv
, fetchFromGitHub
, rustPlatform
, pkg-config
, openssl
, pkgs ? import <nixpkgs> { }
}:

rustPlatform.buildRustPackage rec {
  pname = "himalaya";
  version = "0.2.7";

  src = fetchFromGitHub {
    owner = "soywod";
    repo = pname;
    rev = "v${version}";
    sha256 = "0yp3gc5hmlrs5rcmb2qbi4iqb5ndflgqw20qa7ziqayrdd15kzpn";
  };

  nativeBuildInputs = [ pkg-config ];
  buildInputs = [ openssl ] ++ pkgs.lib.optionals stdenv.isDarwin [
    pkgs.darwin.apple_sdk.frameworks.Security
    pkgs.libiconv
  ];

  cargoSha256 = "1abz3s9c3byqc0vaws839hjlf96ivq4zbjyijsbg004ffbmbccpn";

  meta = with pkgs.lib; {
    description = "Minimalist CLI email client, written in Rust.";
    homepage = "https://github.com/soywod/himalaya";
    license = licenses.bsd3;
  };
}
