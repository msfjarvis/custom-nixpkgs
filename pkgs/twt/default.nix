{
  stdenv,
  pkgs,
}:
pkgs.rustPlatform.buildRustPackage rec {
  pname = "twt";
  version = "1.1.0";

  src = pkgs.fetchFromGitHub {
    owner = "msfjarvis";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-KbUQFD0sk7WzQ2+orOF0fxzs+nR54r1nx1GUnHMBeTQ=";
  };

  buildInputs =
    pkgs.lib.optionals stdenv.isDarwin
    [pkgs.darwin.apple_sdk.frameworks.Security];

  cargoHash = "sha256-vlhx+sNvctXOgtUQpQ2ncz9Fn3KwEL6lRwaSuWuqzts=";

  meta = with pkgs.lib; {
    description = "Multipurpose tool to extract metadata from a user's tweets";
    homepage = "https://msfjarvis.dev/g/twt/";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
