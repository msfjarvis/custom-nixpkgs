let
  rustOverlay = import (builtins.fetchTarball {
    url =
      "https://github.com/oxalica/rust-overlay/archive/299e85fc8fd9def5fdb9d517c9f367f8d15bd0de.tar.gz";
    sha256 = "sha256-N3sguyZc55GvT6gNXxZpZDrpKwC7QvErnbKxaKdOvKY=";
  });
  pkgs = import <nixpkgs> { overlays = [ rustOverlay ]; };
  rustSpecific = pkgs.rust-bin.stable.latest.default.override {
    extensions =
      [ "rust-src" "rustc-dev" "rustfmt-preview" "llvm-tools-preview" ];
    targets = pkgs.lib.optionals pkgs.stdenv.isDarwin [ "aarch64-apple-darwin" ]
      ++ pkgs.lib.optionals pkgs.stdenv.isLinux [ "x86_64-unknown-linux-gnu" ];
  };
in pkgs.makeRustPlatform {
  cargo = rustSpecific;
  rustc = rustSpecific;
}
