{ stdenv, fetchFromGitHub, rustPlatform, pkgs ? import <nixpkgs> { } }:

rustPlatform.buildRustPackage rec {
  pname = "twt";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "msfjarvis";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-H7r72HHvsp7T4LGc7TXf3yiQUIn8GPPnqSeWULZ95XE=";
  };

  buildInputs = pkgs.lib.optionals stdenv.isDarwin
    [ pkgs.darwin.apple_sdk.frameworks.Security ];

  cargoSha256 = "sha256-2DdF/tlalw6MNl2RnnW1oIUU4LO9qy4GoTHBGi6ZCfE=";

  meta = with pkgs.lib; {
    description = "Multipurpose tool to extract metadata from a user's tweets";
    homepage = "https://msfjarvis.dev/g/twt/";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
