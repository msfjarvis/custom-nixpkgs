{ stdenv, pkgs }:

pkgs.rustPlatform.buildRustPackage rec {
  pname = "hyperlink";
  version = "0.1.26";

  src = pkgs.fetchFromGitHub {
    owner = "untitaker";
    repo = pname;
    rev = version;
    sha256 = "sha256-V1CFk08Wm8/92rul3EOFrSuOm1oRp+8hGExaf+DZwl0=";
  };

  cargoSha256 = "sha256-v7n5C9637NPztZBI8qavGZzGng9FtfPuWtGMpBCqIeo=";

  meta = with pkgs.lib; {
    description = "Very fast link checker for CI.";
    homepage = "https://github.com/untitaker/hyperlink";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
