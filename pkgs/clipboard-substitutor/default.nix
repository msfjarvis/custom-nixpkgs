{
  lib,
  rustPlatform,
  fetchFromGitHub,
  stdenv,
  darwin,
  xorg,
}:
rustPlatform.buildRustPackage rec {
  pname = "clipboard-substitutor";
  version = "0.7.4";

  src = fetchFromGitHub {
    owner = "msfjarvis";
    repo = "clipboard-substitutor";
    rev = "v${version}";
    hash = "sha256-WevcICkODt1vrjNctHrMLXjbbZ7Ggxtp7H47lMnLfkc=";
  };

  buildFeatures = lib.optionals stdenv.isLinux ["journald"];
  cargoHash = "sha256-SzikVNQmY3jzvu+3ZJ7JiKDmw7iuyveQ+Cq95Cdzkx8=";

  buildInputs =
    lib.optionals stdenv.isDarwin [
      darwin.apple_sdk.frameworks.AppKit
    ]
    ++ lib.optionals stdenv.isLinux [
      xorg.libxcb
    ];

  meta = with lib; {
    description = "CLI to listen to clipboard events and perform operations on the copied text";
    homepage = "https://github.com/msfjarvis/clipboard-substitutor";
    license = with licenses; [asl20 mit];
    maintainers = with maintainers; [];
  };
}
