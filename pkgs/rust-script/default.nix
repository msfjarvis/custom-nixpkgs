{ stdenv, fetchFromGitHub, rustPlatform, pkgs ? import <nixpkgs> { }, pkg-config
}:

rustPlatform.buildRustPackage rec {
  pname = "rust-script";
  version = "0.16.0";
  # Tests don't work
  doCheck = false;

  src = fetchFromGitHub {
    owner = "fornwall";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-frNoCZs+LYHzY5Z50PqnwdjVtMGmccBzKhL33g/KUjo=";
  };

  nativeBuildInputs = [ pkg-config ];

  cargoSha256 = "sha256-PeEmJronmwApXMZ6UP4hqSDjj7YOBpcOcE8qVhWQEAg=";

  buildInputs = [ ] ++ pkgs.lib.optionals stdenv.isDarwin [
    pkgs.darwin.apple_sdk.frameworks.Security
    pkgs.libiconvReal
  ];

  meta = with pkgs.lib; {
    description =
      ''Command-line tool to run Rust "scripts" which can make use of crates.'';
    homepage = "https://rust-script.org/";
    license = licenses.mit;
    platform = platforms.all;
  };
}
