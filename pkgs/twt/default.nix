{
  lib,
  rustPlatform,
  fetchFromGitHub,
  stdenv,
  darwin,
}:
rustPlatform.buildRustPackage rec {
  pname = "twt";
  version = "1.2.2";

  src = fetchFromGitHub {
    owner = "msfjarvis";
    repo = "twt";
    rev = "v${version}";
    hash = "sha256-mAfaptu/hHCWyTqg9VAkMJqgXtwWSOYqMyTE2HKE2+8=";
  };

  cargoHash = "sha256-/J/V2CVvivDFsEx3yS8hDp8cI4kSxfJAkP6QvVcSi0g=";

  buildInputs = lib.optionals stdenv.isDarwin [
    darwin.apple_sdk.frameworks.CoreFoundation
    darwin.apple_sdk.frameworks.Security
  ];

  meta = with lib; {
    description = "Tools for extracting metadata from tweets";
    homepage = "https://github.com/msfjarvis/twt";
    license = with licenses; [asl20 mit];
    maintainers = with maintainers; [msfjarvis];
  };
}
