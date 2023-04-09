{
  lib,
  rustPlatform,
  fetchFromGitHub,
  stdenv,
  darwin,
}:
rustPlatform.buildRustPackage rec {
  pname = "twt";
  version = "1.2.1";

  src = fetchFromGitHub {
    owner = "msfjarvis";
    repo = "twt";
    rev = "v${version}";
    hash = "sha256-bBE0B4m9CSLFpBSD+BjbD74vMrY8aEd5nxf5RLRr8fA=";
  };

  cargoHash = "sha256-h6KsHesCpn19DJvFsEEle7CAivQ/fSP4/+tLZw7gmRo=";

  buildInputs = lib.optionals stdenv.isDarwin [
    darwin.apple_sdk.frameworks.CoreFoundation
    darwin.apple_sdk.frameworks.Security
  ];

  meta = with lib; {
    description = "Tools for extracting metadata from tweets";
    homepage = "https://github.com/msfjarvis/twt";
    license = with licenses; [asl20 mit];
    maintainers = with maintainers; [];
  };
}
