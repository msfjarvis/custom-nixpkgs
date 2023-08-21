{
  lib,
  rustPlatform,
  fetchFromGitHub,
  stdenv,
  darwin,
}:
rustPlatform.buildRustPackage rec {
  pname = "samply";
  version = "unstable-2023-07-11";

  src = fetchFromGitHub {
    owner = "mstange";
    repo = "samply";
    rev = "d4b3fa2a30f755340d1bd9df3f6b3417b165569b";
    hash = "sha256-d2OLyjjztdDUQKdsAa8S9CmfcXqu9lJ1EXqiEBRbxWo=";
  };

  buildInputs = lib.optionals stdenv.isDarwin [
    darwin.apple_sdk.frameworks.CoreFoundation
    darwin.apple_sdk.frameworks.CoreServices
    darwin.apple_sdk.frameworks.Security
  ];

  buildAndTestSubdir = "samply";

  cargoHash = "sha256-deOXO+NmgETX33vY2KdFdCverojr+i2FdemhGXWZ3NU=";

  doCheck = false;

  meta = with lib; {
    description = "A command line profiler for macOS and Linux";
    homepage = "https://github.com/mstange/samply/";
    license = with licenses; [asl20 mit];
    maintainers = with maintainers; [msfjarvis];
    mainProgram = "samply";
  };
}
