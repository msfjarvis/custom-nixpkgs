{ lib, fetchFromGitHub, rustPlatform, pkgs ? import <nixpkgs> { } }:

rustPlatform.buildRustPackage rec {
  pname = "natls";
  version = "2.1.14";

  src = fetchFromGitHub {
    owner = "willdoescode";
    repo = "nat";
    rev = "v${version}";
    sha256 = "0629nfcf43pzkx1rp6k1nr5sdpsjsgrs21f8yc7g20kxlnppc7z3";
  };

  cargoSha256 = "1qkcg9rysiqcjzb6x23kgbpvxn91r19qjv2vx2s79y91j5pyn0ms";

  meta = with pkgs.lib; {
    description = "the 'ls' replacement you never knew you needed";
    homepage = "https://github.com/willdoescode/nat";
    license = licenses.mit;
  };
}
