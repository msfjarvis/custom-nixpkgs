{
  stdenv,
  pkgs,
}:
pkgs.rustPlatform.buildRustPackage rec {
  pname = "adx";
  version = "4.4.0";

  src = pkgs.fetchFromGitHub {
    owner = "msfjarvis";
    repo = "adx";
    rev = "v${version}";
    sha256 = "sha256-LA1qO1dzQd1nmggJnQcgUlj766Ax1nY80zL0eitTl4A=";
  };

  buildInputs =
    pkgs.lib.optionals stdenv.isDarwin
    [pkgs.darwin.apple_sdk.frameworks.Security];

  cargoSha256 = "sha256-FRxWGbQgUXR4b1PO9YEpXk87vyeqD023RD9aeBx+JzE=";

  meta = with pkgs.lib; {
    description = "Rust binary that polls Google's Maven repository and extracts the latest version of all dependencies, with as few network calls as possible.";
    homepage = "https://github.com/msfjarvis/androidx-release-watcher";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
