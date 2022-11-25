{ stdenv, pkgs }:

pkgs.rustPlatform.buildRustPackage rec {
  pname = "katbin";
  version = "1.3.13";

  src = pkgs.fetchFromGitHub {
    owner = "SphericalKat";
    repo = "katbin-cli";
    rev = "v${version}";
    sha256 = "sha256-thL2NUaE6UNPiEjsmNHcbcF7/Rs2JZcPDQq5sL0roYU=";
  };

  buildInputs = pkgs.lib.optionals stdenv.isDarwin
    [ pkgs.darwin.apple_sdk.frameworks.Security ];

  cargoSha256 = "sha256-qfeHd6ry1NhKFH3UnQggJRF4nWnkr47kr4bL5W9Yo3E=";

  meta = with pkgs.lib; {
    description = "A CLI for katbin";
    homepage = "https://katb.in/";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
