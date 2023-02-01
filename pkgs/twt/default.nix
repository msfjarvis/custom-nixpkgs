{
  stdenv,
  pkgs,
}:
pkgs.rustPlatform.buildRustPackage rec {
  pname = "twt";
  version = "1.0.3";

  src = pkgs.fetchFromGitHub {
    owner = "msfjarvis";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-CYQcKy+iyPLYXRQkdt2W1fGqlpoEdihpJSbgw0OohDg=";
  };

  buildInputs =
    pkgs.lib.optionals stdenv.isDarwin
    [pkgs.darwin.apple_sdk.frameworks.Security];

  cargoHash = "sha256-fDrZJKrzUcs2LH6H8ZIPSIxcC3yMC3D7tiaJ71D/Nt4=";

  meta = with pkgs.lib; {
    description = "Multipurpose tool to extract metadata from a user's tweets";
    homepage = "https://msfjarvis.dev/g/twt/";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
