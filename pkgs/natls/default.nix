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

  cargoSha256 = "022wad6d2qm515m7v8qx1cgilxygg63mlqlxfaql5cm1z6chfvh2";

  meta = with pkgs.lib; {
    description = "the 'ls' replacement you never knew you needed";
    homepage = "https://github.com/willdoescode/nat";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
