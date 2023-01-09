{
  stdenv,
  pkgs,
}:
pkgs.rustPlatform.buildRustPackage rec {
  pname = "katbin";
  version = "1.3.14-develop.1";

  src = pkgs.fetchFromGitHub {
    owner = "SphericalKat";
    repo = "katbin-cli";
    rev = "v${version}";
    sha256 = "sha256-0DiXswIUyLRIpVM26x6Q/efEG1ueu8CgaUoto7KBfmA=";
  };

  buildInputs =
    pkgs.lib.optionals stdenv.isDarwin
    [pkgs.darwin.apple_sdk.frameworks.Security];

  cargoSha256 = "sha256-zI3YZ8m9YQ1+ZWiRyX4nPAP86BKpSg80G+dabkePGhk=";

  meta = with pkgs.lib; {
    description = "A CLI for katbin";
    homepage = "https://katb.in/";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
