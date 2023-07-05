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
  version = "0.1.1";

  src = fetchFromGitHub {
    owner = "axodotdev";
    repo = "oranda";
    rev = "v${version}";
    hash = "sha256-hxGRBMePUVod0Nwz2ozkZ6vmV7Ev+KeUFVKQDEViFJw=";
  };

  cargoHash = "sha256-Bn9dH+Iw825vuInip3KVx2zAPZixQ3vHkfoDFwPFzpk=";

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
  };
}
