{ stdenv, fetchFromGitHub, rustPlatform, pkg-config, pkgs ? import <nixpkgs> { }
}:

rustPlatform.buildRustPackage rec {
  pname = "file-collector";
  version = "0.2.2";

  src = fetchFromGitHub {
    owner = "msfjarvis";
    repo = "file-collector";
    rev = "v${version}";
    sha256 = "sha256-6oAFtMCtcwbblMnFT2wrOqIfKVpPB4c7AWj4E+9lBhg=";
  };

  buildFeatures = pkgs.lib.optionals stdenv.isLinux [ "journald" ];
  cargoSha256 = "sha256-hxs/2X4JQ5M9CsBFv6btCb3Bxs1InS1YA4gL+mKQfUs=";

  meta = with pkgs.lib; {
    description =
      "Simple CLI tool to watch directories and move their files to a single dumping ground";
    homepage = "https://msfjarvis.dev/g/file-collector";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
