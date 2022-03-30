let
  rustOverlay = import (builtins.fetchTarball {
    url =
      "https://github.com/oxalica/rust-overlay/archive/d477108aefccc46e4b7acc8008f03d4e823da7b0.tar.gz";
    sha256 = "sha256-rTpgRsgIeCYY4e4Qj+gMT1H80E0f7ITNyseOaPSiyrM=";
  });
  pkgs = import <nixpkgs> { overlays = [ rustOverlay ]; };
  rustSpecific = pkgs.rust-bin.stable.latest.default;
in pkgs.makeRustPlatform {
  cargo = rustSpecific;
  rustc = rustSpecific;
}
