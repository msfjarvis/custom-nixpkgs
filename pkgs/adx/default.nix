{
  stdenv,
  pkgs,
}:
pkgs.rustPlatform.buildRustPackage rec {
  pname = "adx";
  version = "4.4.1";

  src = pkgs.fetchFromGitHub {
    owner = "msfjarvis";
    repo = "adx";
    rev = "v${version}";
    sha256 = "sha256-ToEpcUpxj76Bu1WSUZ99v7EJXeJBwpLMuBlPuDNnHvw=";
  };

  buildInputs =
    pkgs.lib.optionals stdenv.isDarwin
    [pkgs.darwin.apple_sdk.frameworks.Security];

  cargoHash = "sha256-Hnci1Y2Zz5umoRHMaLLOJkYMNEJTxL7Jjfdb/XIuhSo=";

  meta = with pkgs.lib; {
    description = "Rust binary that polls Google's Maven repository and extracts the latest version of all dependencies, with as few network calls as possible.";
    homepage = "https://github.com/msfjarvis/androidx-release-watcher";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
