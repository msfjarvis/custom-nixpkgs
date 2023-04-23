{
  lib,
  rustPlatform,
  fetchFromGitHub,
  pkg-config,
  curl,
  openssl,
  zlib,
  stdenv,
  darwin,
}:
rustPlatform.buildRustPackage rec {
  pname = "rye";
  version = "unstable-2023-04-23";

  src = fetchFromGitHub {
    owner = "mitsuhiko";
    repo = "rye";
    rev = "4d13663f1b3e4bfda5c00f8f33936e508ab02e68";
    hash = "sha256-owvLj6hXxDS5k8pgHZVDfKChCM2BpEEfEhplkYYVZS8=";
  };

  cargoHash = "sha256-eyJ6gXFVnSC1aEt5YLl5rFoa3+M73smu5wJdAN15HQM=";

  nativeBuildInputs = [
    pkg-config
  ];

  doCheck = false;

  buildInputs =
    [
      curl
      openssl
      zlib
    ]
    ++ lib.optionals stdenv.isDarwin [
      darwin.apple_sdk.frameworks.Security
    ];

  meta = with lib; {
    description = "An experimental alternative to poetry/pip/pipenv/pyenv/venv/virtualenv/pdm/hatch";
    homepage = "https://github.com/mitsuhiko/rye";
    license = licenses.mit;
    maintainers = with maintainers; [];
  };
}
