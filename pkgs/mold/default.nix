{ lib, fetchFromGitHub, pkgs ? import <nixpkgs> { }, pkg-config, clang11Stdenv
}:

clang11Stdenv.mkDerivation rec {
  pname = "mold";
  version = "0.1.1-40-g8940abf807ba";

  src = fetchFromGitHub {
    owner = "rui314";
    repo = "mold";
    rev = "8940abf807bab12e7ec3a0f807614eab680fa04c";
    sha256 = "089cmn1g2fb4cn23gpfrxsp9a4wk0k7xv5g3i297wy50inypdnnz";
  };

  nativeBuildInputs = [ pkg-config ];

  buildInputs = with pkgs; [ git openssl_1_1 tbb xxHash zlib ];

  buildFlagsArray = [ "-j24" ];

  meta = with pkgs.lib; {
    description =
      "mold is a high performance drop-in replacement for existing Unix linkers";
    homepage = "https://github.com/rui314/mold";
    license = licenses.agpl3Only;
    platform = platforms.linux;
  };
}
