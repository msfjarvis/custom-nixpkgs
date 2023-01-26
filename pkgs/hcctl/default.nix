{
  stdenv,
  pkgs,
}:
pkgs.rustPlatform.buildRustPackage rec {
  pname = "hcctl";
  version = "2.0.6";

  src = pkgs.fetchFromGitHub {
    owner = "msfjarvis";
    repo = "healthchecks-rs";
    rev = "hcctl-v${version}";
    sha256 = "sha256-9HdBgz6Am5k0S6d2hkRXDS+L3haJnaFMu/lcDIC21Ro=";
  };

  nativeBuildInputs = [pkgs.pkg-config];
  buildInputs =
    pkgs.lib.optionals stdenv.isDarwin
    [pkgs.darwin.apple_sdk.frameworks.Security];

  buildAndTestSubdir = "hcctl";

  cargoHash = "sha256-EHLpaDLMzXhtkMhqHsMkSVBZppDKfKDMk5Ne/do4Lcw=";

  meta = with pkgs.lib; {
    description = "Simple CLI tool to keep a track of your https://healthchecks.io account";
    homepage = "https://msfjarvis.dev/g/healthchecks-rs";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
