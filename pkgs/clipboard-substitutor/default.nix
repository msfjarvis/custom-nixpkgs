{ stdenv, fetchFromGitHub, rustPlatform, pkg-config, pkgs ? import <nixpkgs> { }
}:

rustPlatform.buildRustPackage rec {
  pname = "clipboard-substitutor";
  version = "0.7.3";

  src = fetchFromGitHub {
    owner = "msfjarvis";
    repo = "clipboard-substitutor";
    rev = "v${version}";
    sha256 = "sha256-3yPL46SJBOEIcWaJPLJ8UNyRmtaTN43TMHgjHzBpUwY=";
  };

  buildFeatures = pkgs.lib.optionals stdenv.isLinux [ "journald" ];
  cargoSha256 = "sha256-1nutZIzeKGZO8u2m9wsNi0CHgpIKsyfLDi/EgZGXvsY=";

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
