{
  stdenv,
  pkgs,
}:
pkgs.rustPlatform.buildRustPackage rec {
  pname = "cargo-dist";
  version = "0.0.2";

  src = pkgs.fetchFromGitHub {
    owner = "axodotdev";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-7/TUk9LGwmHhKwFtwFQM7C/1ItRsoJ4IodeUPWfGjkc=";
  };

  cargoHash = "sha256-vmHPjecd1u0f8wSTu+LE2BNiZlskDADLXNjIj2v7D5E=";

  meta = with pkgs.lib; {
    description = "Package shippable application packaging for Rust";
    homepage = "https://github.com/axodotdev/cargo-dist";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
