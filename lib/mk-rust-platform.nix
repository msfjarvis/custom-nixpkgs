{ callPackage, fetchFromGitHub, makeRustPlatform }:

{ date, channel }:

let
  mozillaOverlay = fetchFromGitHub {
    owner = "mozilla";
    repo = "nixpkgs-mozilla";
    rev = "0510159186dd2ef46e5464484fbdf119393afa58";
    sha256 = "sha256-HJX4Pc5ZUAg4apxB/XHuJ+6ukzvRQqeZMjscOBst2bA=";
  };
  mozilla = callPackage "${mozillaOverlay.out}/package-set.nix" { };
  rustSpecific = (mozilla.rustChannelOf { inherit date channel; }).rust;

in makeRustPlatform {
  cargo = rustSpecific;
  rustc = rustSpecific;
}
