{
  lib,
  rustPlatform,
  fetchFromGitHub,
  stdenv,
  darwin,
}:
rustPlatform.buildRustPackage rec {
  pname = "healthchecks-monitor";
  version = "3.0.4";

  src = fetchFromGitHub {
    owner = "msfjarvis";
    repo = "healthchecks-rs";
    rev = "healthchecks-monitor-v${version}";
    hash = "sha256-9HdBgz6Am5k0S6d2hkRXDS+L3haJnaFMu/lcDIC21Ro=";
  };

  buildInputs =
    lib.optionals stdenv.isDarwin
    [darwin.apple_sdk.frameworks.Security];

  buildAndTestSubdir = "monitor";

  cargoHash = "sha256-JFwGqeB5WkRC8epygJi4RErZCqtWF/K9YZYLZ5kwvWw=";

  meta = with lib; {
    description = "CLI tool to run shell jobs and report status to https://healthchecks.io";
    homepage = "https://msfjarvis.dev/g/healthchecks-rs";
    license = with licenses; [asl20 mit];
    maintainers = with maintainers; [msfjarvis];
  };
}
