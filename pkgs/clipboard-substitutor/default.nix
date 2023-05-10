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
  version = "0.7.5";

  src = fetchFromGitHub {
    owner = "msfjarvis";
    repo = "clipboard-substitutor";
    rev = "v${version}";
    hash = "sha256-obzyM5uN70EXiLwuIZsrdJiL/oFmICYyJORHK3UjnXw=";
  };

  buildFeatures = lib.optionals stdenv.isLinux ["journald"];
  cargoHash = "sha256-aGBbni1faj2yA+qZPytHna90b/1/iObu4ECnpR3uIpU=";

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
  };
}
