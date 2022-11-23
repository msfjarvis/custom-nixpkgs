{ stdenv, pkgs }:

pkgs.rustPlatform.buildRustPackage rec {
  pname = "hcctl";
  version = "2.0.5";

  src = pkgs.fetchFromGitHub {
    owner = "msfjarvis";
    repo = "healthchecks-rs";
    rev = "hcctl-v${version}";
    sha256 = "sha256-KCV2AWdd3reh6B2ghnj/9yOtt+B38esuPk+aTnuXXNQ=";
  };

  nativeBuildInputs = [ pkgs.pkg-config ];
  buildInputs = pkgs.lib.optionals stdenv.isDarwin
    [ pkgs.darwin.apple_sdk.frameworks.Security ];

  buildAndTestSubdir = "hcctl";

  cargoSha256 = "sha256-0xHrnlGxKczogSyAHYRzv9FsB9GJm1pCebuqsTBBlp8=";

  meta = with pkgs.lib; {
    description =
      "Simple CLI tool to keep a track of your https://healthchecks.io account";
    homepage = "https://msfjarvis.dev/g/healthchecks-rs";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
