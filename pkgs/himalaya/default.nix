{ stdenv
, fetchFromGitHub
, rustPlatform
, pkg-config
, openssl
, pkgs ? import <nixpkgs> { }
}:

rustPlatform.buildRustPackage rec {
  pname = "himalaya";
  version = "0.2.6";

  src = fetchFromGitHub {
    owner = "soywod";
    repo = pname;
    rev = "v${version}";
    sha256 = "1fl3lingb4wdh6bz4calzbibixg44wnnwi1qh0js1ijp8b6ll560";
  };

  nativeBuildInputs = [ pkg-config ];
  buildInputs = [ openssl ] ++ pkgs.lib.optionals stdenv.isDarwin [
    pkgs.darwin.apple_sdk.frameworks.Security
    pkgs.libiconv
  ];

  cargoSha256 = "10p8di71w7hn36b1994wgk33fnj641lsp80zmccinlg5fiwyzncx";

  meta = with pkgs.lib; {
    description = "Minimalist CLI email client, written in Rust.";
    homepage = "https://github.com/soywod/himalaya";
    license = licenses.bsd3;
  };
}
