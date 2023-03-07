{
  stdenv,
  pkgs,
}:
pkgs.rustPlatform.buildRustPackage rec {
  pname = "twt";
  version = "1.2.0";

  src = pkgs.fetchFromGitHub {
    owner = "msfjarvis";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-cdYdsDk71skhoVN5oLP6QUG0y8ubqqbcXa+/JNt+dKA=";
  };

  buildInputs =
    pkgs.lib.optionals stdenv.isDarwin
    [pkgs.darwin.apple_sdk.frameworks.Security];

  cargoHash = "sha256-kaYlm6Fr+Dw3EyycklgUer1zJj4gSYJlRro8rCdtBEY=";

  meta = with pkgs.lib; {
    description = "Multipurpose tool to extract metadata from a user's tweets";
    homepage = "https://msfjarvis.dev/g/twt/";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
