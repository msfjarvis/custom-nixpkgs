{
  lib,
  rustPlatform,
  fetchFromGitHub,
  stdenv,
  darwin,
}:
rustPlatform.buildRustPackage rec {
  pname = "katbin-cli";
  version = "1.3.13";

  src = fetchFromGitHub {
    owner = "SphericalKat";
    repo = "katbin-cli";
    rev = "v${version}";
    hash = "sha256-thL2NUaE6UNPiEjsmNHcbcF7/Rs2JZcPDQq5sL0roYU=";
  };

  cargoHash = "sha256-S9kGW9pV0otjoDNZQqTMQhBr+Y/ilQpcw2GnvimGe+0=";

  buildInputs = lib.optionals stdenv.isDarwin [
    darwin.apple_sdk.frameworks.Security
  ];

  meta = with lib; {
    description = "A CLI for katbin";
    homepage = "https://github.com/SphericalKat/katbin-cli";
    changelog = "https://github.com/SphericalKat/katbin-cli/blob/${src.rev}/CHANGELOG.md";
    license = with licenses; [];
    maintainers = with maintainers; [];
  };
}
