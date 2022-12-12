{ stdenv, pkgs }:

pkgs.rustPlatform.buildRustPackage rec {
  pname = "twt";
  version = "1.0.1";

  src = pkgs.fetchFromGitHub {
    owner = "msfjarvis";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-wq3pQNR72EQqeiWbC82ZXTg10601BC2x8mjkLsi6dzA=";
  };

  buildInputs = pkgs.lib.optionals stdenv.isDarwin
    [ pkgs.darwin.apple_sdk.frameworks.Security ];

  cargoSha256 = "sha256-WaQocM8BTad+y5fpKg3HZE1U1u4Xl5+NW5eeTIQTiTE=";

  meta = with pkgs.lib; {
    description = "Multipurpose tool to extract metadata from a user's tweets";
    homepage = "https://msfjarvis.dev/g/twt/";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
