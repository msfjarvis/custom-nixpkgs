{
  stdenv,
  pkgs,
}:
pkgs.rustPlatform.buildRustPackage rec {
  pname = "hyperlink";
  version = "0.1.27";

  src = pkgs.fetchFromGitHub {
    owner = "untitaker";
    repo = pname;
    rev = version;
    sha256 = "sha256-d2p608Pie6OglEY0JA5DGXaoqXrD00iViVnfjKMDN1I=";
  };

  cargoHash = "sha256-ncrETUQ0E4+7yoZU3bci/Ksr8WVte6DQoax5WEVOXM4=";

  meta = with pkgs.lib; {
    description = "Very fast link checker for CI.";
    homepage = "https://github.com/untitaker/hyperlink";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
