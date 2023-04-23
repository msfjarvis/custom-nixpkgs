{
  lib,
  rustPlatform,
  fetchFromGitHub,
  stdenv,
  darwin,
}:
rustPlatform.buildRustPackage rec {
  pname = "katbin-cli";
  version = "1.3.15";

  src = fetchFromGitHub {
    owner = "SphericalKat";
    repo = "katbin-cli";
    rev = "v${version}";
    hash = "sha256-MGYzh5OBNPy2e+RVSppA7a1+cixyaxMwXeOuRV9aFmg=";
  };

  cargoHash = "sha256-Wbcw2eMD2OtL7qp8XL2Ri60yuyisiQRatY77egtEKlg=";

  buildInputs = lib.optionals stdenv.isDarwin [
    darwin.apple_sdk.frameworks.Security
  ];

  meta = with lib; {
    description = "A CLI for katbin";
    homepage = "https://github.com/SphericalKat/katbin-cli";
    changelog = "https://github.com/SphericalKat/katbin-cli/blob/${src.rev}/CHANGELOG.md";
    license = with licenses; [];
    maintainers = with maintainers; [];
  };
}
