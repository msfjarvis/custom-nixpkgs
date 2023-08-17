{
  lib,
  rustPlatform,
  fetchFromGitHub,
  stdenv,
  darwin,
}:
rustPlatform.buildRustPackage rec {
  pname = "twt";
  version = "1.2.4";

  src = fetchFromGitHub {
    owner = "msfjarvis";
    repo = "twt";
    rev = "v${version}";
    hash = "sha256-a1VtwFT/k504FeqiRZ1aX+B8O2sD4lTD/lo5PARojpA=";
  };

  cargoHash = "sha256-Uuf4L7pRX9daoO1wyMD+vsCdvH4iWi86nI6YzPw35wE=";

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
