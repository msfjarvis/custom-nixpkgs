{
  lib,
  rustPlatform,
  fetchFromGitHub,
  stdenv,
  darwin,
}:
rustPlatform.buildRustPackage rec {
  pname = "adx";
  version = "4.4.1";

  src = fetchFromGitHub {
    owner = "msfjarvis";
    repo = "adx";
    rev = "v${version}";
    hash = "sha256-ToEpcUpxj76Bu1WSUZ99v7EJXeJBwpLMuBlPuDNnHvw=";
  };

  cargoHash = "sha256-Hnci1Y2Zz5umoRHMaLLOJkYMNEJTxL7Jjfdb/XIuhSo=";

  buildInputs = lib.optionals stdenv.isDarwin [
    darwin.apple_sdk.frameworks.Security
  ];

  meta = with lib; {
    description = "Rust tooling to poll Google Maven repository for updates to AndroidX artifacts";
    homepage = "https://github.com/msfjarvis/adx";
    license = with licenses; [asl20 mit];
    maintainers = with maintainers; [msfjarvis];
  };
}
