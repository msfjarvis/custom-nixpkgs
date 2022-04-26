{ stdenv, fetchFromGitHub, pkg-config, pkgs ? import <nixpkgs> { }, rustPlatform
}:

rustPlatform.buildRustPackage rec {
  pname = "clipboard-substitutor";
  version = "0.5.0";

  src = fetchFromGitHub {
    owner = "msfjarvis";
    repo = "clipboard-substitutor";
    rev = "v${version}";
    sha256 = "sha256-twnMVIjjGAfZqq8l+BPNDXqiU0USzNnFpbLEj4cSZYU=";
  };

  buildFeatures = pkgs.lib.optionals stdenv.isLinux [ "journald" ];
  cargoSha256 = "sha256-PVc0pu02iVihJCzvIBCDNNhw8PcghRxxv1aRyaiDn5c=";

  nativeBuildInputs = [ pkg-config pkgs.python3 ];
  buildInputs = pkgs.lib.optionals stdenv.isLinux [ pkgs.xorg.libxcb ]
    ++ pkgs.lib.optionals stdenv.isDarwin
    [ pkgs.darwin.apple_sdk.frameworks.AppKit ];

  meta = with pkgs.lib; {
    description =
      "CLI tool to monitor clipboard contents and perform actions based on a set of matchers";
    homepage = "https://msfjarvis.dev/g/clipboard-substitutor";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
