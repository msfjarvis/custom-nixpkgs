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
  version = "0.7.6";

  src = fetchFromGitHub {
    owner = "msfjarvis";
    repo = "clipboard-substitutor";
    rev = "v${version}";
    hash = "sha256-3yHYz/mo0YHHHwjxAzYRNwao/PpkDLNRj7q8/Wnps2s=";
  };

  buildFeatures = lib.optionals stdenv.isLinux ["journald"];
  cargoHash = "sha256-A2G6nAZmXd04afJC/yBN+/1SHZvgmymhJrxx2sok9h8=";

  useNextest = true;

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
    maintainers = with maintainers; [msfjarvis];
    mainProgram = "clipboard-substitutor";
  };
}
