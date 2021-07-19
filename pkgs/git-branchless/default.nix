{ stdenv, fetchFromGitHub, rustPlatform, pkg-config, openssl
, pkgs ? import <nixpkgs> { } }:

rustPlatform.buildRustPackage rec {
  pname = "git-branchless";
  version = "0.3.3";
  # Tests require the git executable
  doCheck = false;

  src = fetchFromGitHub {
    owner = "arxanas";
    repo = pname;
    rev = "e395382de43cbf7b380c4a3c86f55b41b1ec7d41";
    sha256 = "1d7rl3iavba453v6z5lvdrjp24wwx65h0ywm1scr9yrvwx96m44h";
  };

  cargoSha256 = "sha256-czsxPKqvEpemXquDcJfKuX6GNhs4V89PCGZjVarLrt8=";

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ pkgs.openssl ] ++ pkgs.lib.optionals stdenv.isDarwin [
    pkgs.darwin.apple_sdk.frameworks.Security
    pkgs.libiconvReal
  ];

  meta = with pkgs.lib; {
    description =
      "Quickfix allows you to commit changes in your git repository to a new branch without leaving the current branch";
    homepage = "https://github.com/siedentop/git-quickfix";
    license = licenses.asl20;
    platform = platforms.all;
  };
}
