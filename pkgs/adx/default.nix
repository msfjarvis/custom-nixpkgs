{ stdenv, pkgs }:

pkgs.rustPlatform.buildRustPackage rec {
  pname = "adx";
  version = "4.3.4";

  src = pkgs.fetchFromGitHub {
    owner = "msfjarvis";
    repo = "adx";
    rev = "v${version}";
    sha256 = "sha256-boTth+mhqzfnM7TOouBfrJ+/ETjgyx0KTKBdbCty5tA=";
  };

  buildInputs = pkgs.lib.optionals stdenv.isDarwin
    [ pkgs.darwin.apple_sdk.frameworks.Security ];

  cargoSha256 = "sha256-f8YYlm2X9APsQmn26zEh3fZkt1uQCdLx5c3kdpbIonY=";

  meta = with pkgs.lib; {
    description =
      "Rust binary that polls Google's Maven repository and extracts the latest version of all dependencies, with as few network calls as possible.";
    homepage = "https://github.com/msfjarvis/androidx-release-watcher";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
