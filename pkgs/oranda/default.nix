{
  lib,
  rustPlatform,
  fetchFromGitHub,
  pkg-config,
  openssl,
  stdenv,
  darwin,
}:
rustPlatform.buildRustPackage rec {
  pname = "oranda";
  version = "0.0.2";

  src = fetchFromGitHub {
    owner = "axodotdev";
    repo = "oranda";
    rev = "css-v${version}";
    hash = "sha256-KbfSCReKjUn6JZGHxhWQvZW9ZQlwXOqbJ5oXv7+KpCo=";
  };

  cargoHash = "sha256-GTSN72YxmrVzdkBGsgFz3ZT2xvOCYNfPhez3rSE2emE=";

  nativeBuildInputs = [
    pkg-config
  ];

  buildInputs =
    [
      openssl
    ]
    ++ lib.optionals stdenv.isDarwin [
      darwin.apple_sdk.frameworks.CoreFoundation
      darwin.apple_sdk.frameworks.Security
    ];

  doCheck = false;

  meta = with lib; {
    description = "generate beautiful landing pages for your developer tools";
    homepage = "https://github.com/axodotdev/oranda";
    changelog = "https://github.com/axodotdev/oranda/blob/${src.rev}/CHANGELOG.md";
    license = with licenses; [asl20 mit];
    maintainers = with maintainers; [];
  };
}