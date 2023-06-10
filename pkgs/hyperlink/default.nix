{
  lib,
  rustPlatform,
  fetchFromGitHub,
}:
rustPlatform.buildRustPackage rec {
  pname = "hyperlink";
  version = "0.1.28";

  src = fetchFromGitHub {
    owner = "untitaker";
    repo = "hyperlink";
    rev = version;
    hash = "sha256-hTRJA7oKFzP/KSAg6a6ziSSxHxwQh1uS2EmdVd1qRb4=";
  };

  cargoHash = "sha256-iyEzEaZ48J81v5oQybFaFrGdLZkSUxlit+SBcbWWrD0=";

  meta = with lib; {
    description = "Very fast link checker for CI";
    homepage = "https://github.com/untitaker/hyperlink";
    license = licenses.mit;
    maintainers = with maintainers; [msfjarvis];
  };
}
