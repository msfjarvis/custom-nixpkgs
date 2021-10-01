{ stdenv, fetchFromGitHub, rustPlatform, pkgs ? import <nixpkgs> { }, pkg-config
}:

rustPlatform.buildRustPackage rec {
  pname = "lychee";
  version = "0.7.1";
  # Tests use network and are impure in nature
  doCheck = false;

  src = fetchFromGitHub {
    owner = "lycheeverse";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-+cyz6ORwsSQTzNiL9hDVz9CuyHIklkJ8LvH2/hbFt4E=";
  };

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ pkgs.openssl ] ++ pkgs.lib.optionals stdenv.isDarwin [
    pkgs.darwin.apple_sdk.frameworks.Security
    pkgs.darwin.apple_sdk.frameworks.SystemConfiguration
    pkgs.libiconvReal
  ];

  cargoSha256 = "sha256-KdqjYXS7kB+T8bS3gMhgfwhaaScsGF1gHHvg53knpU8=";

  meta = with pkgs.lib; {
    description = "A glorious link checker";
    homepage = "https://github.com/lycheeverse/lychee";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
