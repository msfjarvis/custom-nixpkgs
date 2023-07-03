{
  lib,
  rustPlatform,
  fetchFromGitHub,
  stdenv,
  darwin,
}:
rustPlatform.buildRustPackage rec {
  pname = "hcctl";
  version = "2.0.7";

  src = fetchFromGitHub {
    owner = "msfjarvis";
    repo = "healthchecks-rs";
    rev = "hcctl-v${version}";
    hash = "sha256-MCpMKX1T8c6FZ2NIkEqCFL9jBJOB2IEXfYnDvDBlpfc=";
  };

  buildInputs =
    lib.optionals stdenv.isDarwin
    [darwin.apple_sdk.frameworks.Security];

  buildAndTestSubdir = "hcctl";

  cargoHash = "sha256-PjKBwI55+30vMjgU9NN8Fh4XVGTsre7LIKg+g+fCAPo=";

  meta = with lib; {
    description = "Simple CLI tool to keep a track of your https://healthchecks.io account";
    homepage = "https://msfjarvis.dev/g/healthchecks-rs";
    license = with licenses; [asl20 mit];
    maintainers = with maintainers; [msfjarvis];
  };
}
