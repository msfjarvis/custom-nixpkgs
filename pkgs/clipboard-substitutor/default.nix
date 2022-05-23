{ stdenv, fetchFromGitHub, pkg-config, pkgs ? import <nixpkgs> { }, rustPlatform
}:

rustPlatform.buildRustPackage rec {
  pname = "clipboard-substitutor";
  version = "0.6.0";

  src = fetchFromGitHub {
    owner = "msfjarvis";
    repo = "clipboard-substitutor";
    rev = "v${version}";
    sha256 = "sha256-avopl8cJczVFg9UtYZfKuCo6xJGdJknNIYoc8x7nhVY=";
  };

  buildFeatures = pkgs.lib.optionals stdenv.isLinux [ "journald" ];
  cargoSha256 = "sha256-jwig0NIfZI3iVcxxKCWq1a2hFHsKG9PkKGTOfJ489ZA=";

  nativeBuildInputs = [ pkg-config pkgs.python3 ];
  buildInputs = pkgs.lib.optionals stdenv.isDarwin
    [ pkgs.darwin.apple_sdk.frameworks.AppKit ]
    ++ pkgs.lib.optionals stdenv.isLinux [ pkgs.xorg.libxcb ];

  meta = with pkgs.lib; {
    description =
      "CLI tool to monitor clipboard contents and perform actions based on a set of matchers";
    homepage = "https://msfjarvis.dev/g/clipboard-substitutor";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
