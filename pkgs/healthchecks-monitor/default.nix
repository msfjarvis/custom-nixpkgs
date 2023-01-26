{
  stdenv,
  pkgs,
}:
pkgs.rustPlatform.buildRustPackage rec {
  pname = "healthchecks-monitor";
  version = "3.0.4";

  src = pkgs.fetchFromGitHub {
    owner = "msfjarvis";
    repo = "healthchecks-rs";
    rev = "healthchecks-monitor-v${version}";
    sha256 = "sha256-9HdBgz6Am5k0S6d2hkRXDS+L3haJnaFMu/lcDIC21Ro=";
  };

  nativeBuildInputs = [pkgs.pkg-config];
  buildInputs =
    pkgs.lib.optionals stdenv.isDarwin
    [pkgs.darwin.apple_sdk.frameworks.Security];

  buildAndTestSubdir = "monitor";

  cargoHash = "sha256-JFwGqeB5WkRC8epygJi4RErZCqtWF/K9YZYLZ5kwvWw=";

  meta = with pkgs.lib; {
    description = "CLI tool to run shell jobs and report status to https://healthchecks.io";
    homepage = "https://msfjarvis.dev/g/healthchecks-rs";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
