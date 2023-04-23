{
  lib,
  rustPlatform,
  fetchFromGitHub,
  pkg-config,
  bzip2,
  xz,
}:
rustPlatform.buildRustPackage rec {
  pname = "cargo-dist";
  version = "0.0.6-prerelease.3";

  src = fetchFromGitHub {
    owner = "axodotdev";
    repo = "cargo-dist";
    rev = "v${version}";
    hash = "sha256-jRDCK3GXNO3Ta/ShjatYD1vBLjLMjI8scSptEdx2BO4=";
  };

  cargoHash = "sha256-gc80RZTgS3LPS1r8MMXs6R2vreFlcrwof79lRBa7Ddk=";

  nativeBuildInputs = [
    pkg-config
  ];

  buildInputs = [
    bzip2
    xz
  ];

  meta = with lib; {
    description = "Shippable application packaging for Rust";
    homepage = "https://github.com/axodotdev/cargo-dist";
    changelog = "https://github.com/axodotdev/cargo-dist/blob/${src.rev}/CHANGELOG.md";
    license = with licenses; [asl20 mit];
    maintainers = with maintainers; [];
  };
}
