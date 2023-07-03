{
  lib,
  rustPlatform,
  fetchFromGitHub,
  stdenv,
  darwin,
}:
rustPlatform.buildRustPackage rec {
  pname = "healthchecks-monitor";
  version = "3.0.5";

  src = fetchFromGitHub {
    owner = "msfjarvis";
    repo = "healthchecks-rs";
    rev = "healthchecks-monitor-v${version}";
    hash = "sha256-MCpMKX1T8c6FZ2NIkEqCFL9jBJOB2IEXfYnDvDBlpfc=";
  };

  buildInputs =
    lib.optionals stdenv.isDarwin
    [darwin.apple_sdk.frameworks.Security];

  buildAndTestSubdir = "monitor";

  cargoHash = "sha256-mdFGHfQUSdo7J4C6JkGi58l5dIay7sFsWW14kRKoA7M=";

  meta = with lib; {
    description = "CLI tool to run shell jobs and report status to https://healthchecks.io";
    homepage = "https://msfjarvis.dev/g/healthchecks-rs";
    license = with licenses; [asl20 mit];
    maintainers = with maintainers; [msfjarvis];
  };
}
