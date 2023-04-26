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
  version = "0.0.6-prerelease.4";

  src = fetchFromGitHub {
    owner = "axodotdev";
    repo = "cargo-dist";
    rev = "v${version}";
    hash = "sha256-LBUWFghT6pzvLpgJo9bsG6sE7y6/1uE2q1fKUPyqMHk=";
  };

  cargoHash = "sha256-CfP8KIpMh9J6lUdtSxbYapugDyyL9DixebW+3Gllzw4=";

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
