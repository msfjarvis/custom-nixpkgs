{ pkgs }:

let
  mozillaOverlay = pkgs.fetchFromGitHub {
    owner = "mozilla";
    repo = "nixpkgs-mozilla";
    rev = "7c1e8b1dd6ed0043fb4ee0b12b815256b0b9de6f";
    sha256 = "sha256-FMYV6rVtvSIfthgC1sK1xugh3y7muoQcvduMdriz4ag=";
  };
  date = "2021-12-19";
  channel = "nightly";
  mozilla = pkgs.callPackage "${mozillaOverlay.out}/package-set.nix" { };
  rustSpecific = (mozilla.rustChannelOf { inherit date channel; }).rust;

in pkgs.makeRustPlatform {
  cargo = rustSpecific;
  rustc = rustSpecific;
}
