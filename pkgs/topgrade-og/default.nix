{
  lib,
  rustPlatform,
  fetchFromGitHub,
  stdenv,
  darwin,
}:
rustPlatform.buildRustPackage rec {
  pname = "topgrade-og";
  version = "9.0.1";

  src = fetchFromGitHub {
    owner = "r-darwish";
    repo = "topgrade";
    rev = "v${version}";
    hash = "sha256-9zP+rWhaK4fC2Qhd0oq9WVvCkvryooYo09k7016Rbxw=";
  };

  cargoHash = "sha256-4RTOZBzOo+KaFx+Kw4skH4Wnxe9E65+u+omAiYTipyk=";

  buildInputs = lib.optionals stdenv.isDarwin [
    darwin.apple_sdk.frameworks.Security
  ];

  meta = with lib; {
    description = "Upgrade everything";
    homepage = "https://github.com/r-darwish/topgrade";
    license = licenses.gpl3Only;
    maintainers = with maintainers; [msfjarvis];
  };
}
