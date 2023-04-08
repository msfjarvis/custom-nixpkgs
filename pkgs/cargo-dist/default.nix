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
  version = "0.0.5";

  src = fetchFromGitHub {
    owner = "axodotdev";
    repo = "cargo-dist";
    rev = "v${version}";
    hash = "sha256-AbEreN8pv/aZoBX1amoihb6HxWRdMuEX0waBlbvueQw=";
  };

  cargoHash = "sha256-U2pTvTk6oc6PV4W4XBKLzsaqSTb7Oqyw2Ponc9H0xs8=";

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
