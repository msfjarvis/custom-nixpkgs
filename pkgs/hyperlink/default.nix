{
  lib,
  rustPlatform,
  fetchFromGitHub,
}:
rustPlatform.buildRustPackage rec {
  pname = "hyperlink";
  version = "0.1.31";

  src = fetchFromGitHub {
    owner = "untitaker";
    repo = "hyperlink";
    rev = version;
    hash = "sha256-ZmNw4NmDD0VWwnmNjxsA4y5gzVbTzshZLRYzaNJ4iGw=";
  };

  cargoHash = "sha256-5j1Ziwk5uQNIKCRMZpJP4qR0tcyUUvT8i/KZbXq3WzI=";

  doCheck = false;

  meta = with lib; {
    description = "Very fast link checker for CI";
    homepage = "https://github.com/untitaker/hyperlink";
    license = licenses.mit;
    maintainers = with maintainers; [msfjarvis];
    mainProgram = "hyperlink";
  };
}
