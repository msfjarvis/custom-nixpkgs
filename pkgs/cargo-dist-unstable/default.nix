{ lib
, rustPlatform
, fetchFromGitHub
, pkg-config
, bzip2
, xz
, zstd
, stdenv
, darwin
, git
, rustup
}:

rustPlatform.buildRustPackage rec {
  pname = "cargo-dist-unstable";
  version = "0.4.0-prerelease.2";

  src = fetchFromGitHub {
    owner = "axodotdev";
    repo = "cargo-dist";
    rev = "v${version}";
    hash = "sha256-GjavUktFf3JbQIQXrB5iPQOW6UAkraQSRRGJmyj3XUE=";
  };

  cargoHash = "sha256-0TJrdlk/htr2FmEqo+r+Cmi4+7S6GKB6+FD4+WTOJ3A=";

  nativeBuildInputs = [
    pkg-config
  ];

  buildInputs = [
    bzip2
    xz
    zstd
  ] ++ lib.optionals stdenv.isDarwin [
    darwin.apple_sdk.frameworks.Security
    darwin.apple_sdk.frameworks.SystemConfiguration
  ];

  nativeCheckInputs = [
    git
  ] ++ lib.optionals stdenv.isDarwin [
    rustup
  ];

  env = {
    ZSTD_SYS_USE_PKG_CONFIG = true;
  };

  # remove tests that require internet access
  postPatch = ''
    rm cargo-dist/tests/integration-tests.rs
  '';

  useNextest = true;

  meta = with lib; {
    description = "A tool for building final distributable artifacts and uploading them to an archive";
    homepage = "https://github.com/axodotdev/cargo-dist";
    changelog = "https://github.com/axodotdev/cargo-dist/blob/${src.rev}/CHANGELOG.md";
    license = with licenses; [ asl20 mit ];
    maintainers = with maintainers; [ msfjarvis ];
    mainProgram = "cargo-dist";
  };
}
