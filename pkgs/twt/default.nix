{
  lib,
  rustPlatform,
  fetchFromGitHub,
  stdenv,
  darwin,
}:
rustPlatform.buildRustPackage rec {
  pname = "twt";
  version = "1.2.3";

  src = fetchFromGitHub {
    owner = "msfjarvis";
    repo = "twt";
    rev = "v${version}";
    hash = "sha256-1UrL2akWFghr14ArdlWbxWrmUKQFMfEW+fXkloHHBaA=";
  };

  cargoHash = "sha256-n4EBKf7dcgJ4/4yRXreOBZrHTySNlXFdvByGYQP+F+4=";

  buildInputs = lib.optionals stdenv.isDarwin [
    darwin.apple_sdk.frameworks.CoreFoundation
    darwin.apple_sdk.frameworks.Security
  ];

  meta = with lib; {
    description = "Tools for extracting metadata from tweets";
    homepage = "https://github.com/msfjarvis/twt";
    license = with licenses; [asl20 mit];
    maintainers = with maintainers; [msfjarvis];
    mainProgram = "twt";
  };
}
