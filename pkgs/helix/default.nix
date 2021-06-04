{ stdenv, fetchFromGitHub, rustPlatform, pkgs ? import <nixpkgs> { } }:

rustPlatform.buildRustPackage rec {
  pname = "helix";
  version = "0.0.9";
  doCheck = false;

  src = fetchFromGitHub {
    owner = "helix-editor";
    repo = "helix";
    rev = "v${version}";
    sha256 = "19r7iidlja6sninf7m40yvvrg3m51l02vzlhjhiavvfwyj19j7d2";
    fetchSubmodules = true;
  };

  cargoSha256 = "16xaqndkr25qzjzd22253ziy5qwzg9vb9ny0217asd6cln03abac";

  meta = with pkgs.lib; {
    description = "A post-modern modal text editor.";
    homepage = "https://github.com/helix-editor/helix";
    license = licenses.mpl20;
    platform = platforms.all;
  };
}
