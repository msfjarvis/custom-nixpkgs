{
  stdenv,
  pkgs,
}:
pkgs.rustPlatform.buildRustPackage rec {
  pname = "when";
  version = "0.4.0";

  src = pkgs.fetchFromGitHub {
    owner = "mitsuhiko";
    repo = "when";
    rev = "refs/tags/${version}";
    sha256 = "sha256-JvnvGD14VOXu0+xVMF4aQLvgOFLxNsebCSgKZLycHUw=";
    fetchSubmodules = true;
  };

  cargoHash = "sha256-HhxAk5pLOpn2cRDoPkrxyV27n6IGAI2vkep9j3o275I=";

  meta = with pkgs.lib; {
    description = "Timezones from the command line";
    homepage = "https://github.com/mitsuhiko/when";
    license = licenses.asl20;
    platforms = platforms.all;
  };
}
