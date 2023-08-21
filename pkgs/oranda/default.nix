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
  version = "0.3.0-prerelease.4";

  src = fetchFromGitHub {
    owner = "axodotdev";
    repo = "oranda";
    rev = "v${version}";
    hash = "sha256-4kDnqTJQAS7O5wxVsBsDWsEXM4kVOrTjUL9Y7xe0jQQ=";
  };

  cargoHash = "sha256-SlKnr5f0Io94iHMb3lyOiKOQ1HKfOBkireZWk6h6Sdg=";

  doCheck = false;

  nativeBuildInputs = [
    pkg-config
  ];

  buildInputs =
    [
      openssl
    ]
    ++ lib.optionals stdenv.isDarwin [
      darwin.apple_sdk.frameworks.CoreServices
      darwin.apple_sdk.frameworks.Security
    ];

  doCheck = false;

  meta = with lib; {
    description = "generate beautiful landing pages for your developer tools";
    homepage = "https://github.com/axodotdev/oranda";
    changelog = "https://github.com/axodotdev/oranda/blob/${src.rev}/CHANGELOG.md";
    license = with licenses; [asl20 mit];
    maintainers = with maintainers; [msfjarvis];
    mainProgram = "oranda";
  };
}
