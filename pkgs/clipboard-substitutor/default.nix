{
  stdenv,
  pkgs,
}:
pkgs.rustPlatform.buildRustPackage rec {
  pname = "clipboard-substitutor";
  version = "0.7.4";

  src = pkgs.fetchFromGitHub {
    owner = "msfjarvis";
    repo = "clipboard-substitutor";
    rev = "v${version}";
    sha256 = "sha256-WevcICkODt1vrjNctHrMLXjbbZ7Ggxtp7H47lMnLfkc=";
  };

  buildFeatures = pkgs.lib.optionals stdenv.isLinux ["journald"];
  cargoHash = "sha256-SzikVNQmY3jzvu+3ZJ7JiKDmw7iuyveQ+Cq95Cdzkx8=";

  nativeBuildInputs = [pkgs.pkg-config pkgs.python3];
  buildInputs =
    pkgs.lib.optionals stdenv.isDarwin
    [pkgs.darwin.apple_sdk.frameworks.AppKit]
    ++ pkgs.lib.optionals stdenv.isLinux [pkgs.xorg.libxcb];

  meta = with pkgs.lib; {
    description = "CLI tool to monitor clipboard contents and perform actions based on a set of matchers";
    homepage = "https://msfjarvis.dev/g/clipboard-substitutor";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
