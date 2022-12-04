{ stdenv, pkgs }:

pkgs.rustPlatform.buildRustPackage rec {
  pname = "topgrade";
  version = "9.0.1";

  src = pkgs.fetchFromGitHub {
    owner = "r-darwish";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-9zP+rWhaK4fC2Qhd0oq9WVvCkvryooYo09k7016Rbxw=";
  };

  cargoSha256 = "sha256-otn0XvZ0wufD+4mCGSM0hevKM+wWSvFVCKtTu/5m1uA=";

  buildInputs = pkgs.lib.optionals stdenv.isDarwin [
    pkgs.darwin.apple_sdk.frameworks.Cocoa
    pkgs.darwin.apple_sdk.frameworks.Foundation
  ];

  nativeBuildInputs = [ pkgs.installShellFiles ];

  postInstall = ''
    installManPage topgrade.8
  '';

  meta = with pkgs.lib; {
    description = "Upgrade all the things";
    homepage = "https://github.com/r-darwish/topgrade";
    license = licenses.gpl3Only;
    maintainers = with maintainers; [ msfjarvis ];
    broken = stdenv.isDarwin;
  };
}
