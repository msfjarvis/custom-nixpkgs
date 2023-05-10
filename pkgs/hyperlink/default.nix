{
  lib,
  rustPlatform,
  fetchFromGitHub,
}:
rustPlatform.buildRustPackage rec {
  pname = "hyperlink";
  version = "0.1.27";

  src = fetchFromGitHub {
    owner = "untitaker";
    repo = "hyperlink";
    rev = version;
    hash = "sha256-d2p608Pie6OglEY0JA5DGXaoqXrD00iViVnfjKMDN1I=";
  };

  cargoHash = "sha256-ncrETUQ0E4+7yoZU3bci/Ksr8WVte6DQoax5WEVOXM4=";

  meta = with lib; {
    description = "Very fast link checker for CI";
    homepage = "https://github.com/untitaker/hyperlink";
    license = licenses.mit;
    maintainers = with maintainers; [msfjarvis];
  };
}
