{ stdenv, pkgs }:

pkgs.rustPlatform.buildRustPackage rec {
  pname = "comma";
  version = "1.4.0";

  src = pkgs.fetchFromGitHub {
    owner = "nix-community";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-EPrXIDi0yO+AVriQgi3t91CLtmYtgmyEfWtFD+wH8As=";
  };

  cargoSha256 = "sha256-/1b3GF0flhvejZ3C/yOzRGl50sWR4IxprwRoMUYEvm8=";

  meta = with pkgs.lib; {
    description = "Comma runs software without installing it.";
    homepage = "https://github.com/nix-community/comma";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
