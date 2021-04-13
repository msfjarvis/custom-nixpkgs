{ stdenv
, fetchFromGitHub
, rustPlatform
, pkg-config
, openssl
, pkgs ? import <nixpkgs> { }
}:

rustPlatform.buildRustPackage rec {
  pname = "git-quickfix";
  version = "0.0.4";

  src = fetchFromGitHub {
    owner = "siedentop";
    repo = "git-quickfix";
    rev = "v${version}";
    sha256 = "05p4yw9m601agminyjpffv3n4m0xmnibqm3dr2vz8c6nvjn6bm15";
  };

  nativeBuildInputs = [ pkg-config ];
  buildInputs = [ openssl ] ++ pkgs.lib.optionals stdenv.isDarwin [
    pkgs.darwin.apple_sdk.frameworks.Security
    pkgs.libiconv
  ];

  cargoSha256 = "1m2bj1b3ysij9di97lhf1vai5ck6j1g7lybj5xyj97h124z8gmqh";

  meta = with pkgs.lib; {
    description =
      "Quickfix allows you to commit changes in your git repository to a new branch without leaving the current branch";
    homepage = "https://github.com/siedentop/git-quickfix";
    license = licenses.gpl3;
  };
}
