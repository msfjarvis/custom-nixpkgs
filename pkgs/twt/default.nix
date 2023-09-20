{
  lib,
  rustPlatform,
  fetchFromGitHub,
  stdenv,
  darwin,
}:
rustPlatform.buildRustPackage rec {
  pname = "twt";
  version = "1.2.5";

  src = fetchFromGitHub {
    owner = "msfjarvis";
    repo = "twt";
    rev = "v${version}";
    hash = "sha256-5FVbYLYXyIOLwPcUZHqCPJQLf7aFCJ9zYDtDxaOKmLY=";
  };

  cargoHash = "sha256-dLbfigyRO68sUeW1DQWllfNZUtPa54F8pgKC6mv/H9U=";

  useNextest = true;

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
