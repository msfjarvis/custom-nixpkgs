{ stdenv, fetchFromGitHub, rustPlatform, pkgs ? import <nixpkgs> { } }:

rustPlatform.buildRustPackage rec {
  pname = "lychee";
  version = "0.6.0";
  # Tests use network and are impure in nature
  doCheck = false;

  src = fetchFromGitHub {
    owner = "lycheeverse";
    repo = pname;
    rev = "v${version}";
    sha256 = "05wrmy1p9ycn57jsj7p3x1w9cbf310s9cck49zxdmkahksbs13aq";
  };

  nativeBuildInputs = [ pkgs.pkgconfig ];
  buildInputs = [ pkgs.openssl ] ++ pkgs.lib.optionals stdenv.isDarwin
    [ pkgs.darwin.apple_sdk.frameworks.Security pkgs.libiconvReal ];

  cargoSha256 = "072k4wnsxpvakb56wwzx54zc1irii8pkg9bvsy76w4xi6kydrjw8";

  meta = with pkgs.lib; {
    description = "A glorious link checker";
    homepage = "https://github.com/lycheeverse/lychee";
    license = licenses.mit;
  };
}
