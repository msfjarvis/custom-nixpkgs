{ stdenv, fetchFromGitHub, rustPlatform, pkg-config, openssl
, pkgs ? import <nixpkgs> { } }:

rustPlatform.buildRustPackage rec {
  pname = "himalaya";
  version = "0.2.4";

  src = fetchFromGitHub {
    owner = "soywod";
    repo = "himalaya";
    # The lockfile is broken on the 0.2.4 tag so we pin to the commit with the fix
    rev = "e260823581758fa9b1f60639f23c0051e493ee5b"; # "v${version}"
    sha256 = "0lxi4hqjssb8h58sqr9b8hkdgz0n73wyphh5jx2xlnbl5b64g8l6";
  };

  nativeBuildInputs = [ pkg-config ];
  buildInputs = [ openssl ] ++ pkgs.lib.optionals stdenv.isDarwin [
    pkgs.darwin.apple_sdk.frameworks.Security
    pkgs.libiconv
  ];

  cargoSha256 = "0cay36apjz8snmnf58815ricmsh1f9kw29aadq9yid7vjqmjh270";

  meta = with pkgs.lib; {
    description = "Minimalist CLI email client, written in Rust.";
    homepage = "https://github.com/soywod/himalaya";
    license = licenses.bsd3;
  };
}
