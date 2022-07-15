{ stdenv, fetchgit, rustPlatform, pkg-config, pkgs ? import <nixpkgs> { } }:

rustPlatform.buildRustPackage rec {
  pname = "when";
  version = "0.4.0";

  src = fetchgit {
    url = "https://github.com/mitsuhiko/when.git";
    rev = "refs/tags/${version}";
    sha256 = "sha256-JvnvGD14VOXu0+xVMF4aQLvgOFLxNsebCSgKZLycHUw=";
    fetchSubmodules = true;
  };

  cargoSha256 = "sha256-HhxAk5pLOpn2cRDoPkrxyV27n6IGAI2vkep9j3o275I=";

  meta = with pkgs.lib; {
    description = "Timezones from the command line";
    homepage = "https://github.com/mitsuhiko/when";
    license = licenses.asl20;
    platforms = platforms.all;
  };
}
