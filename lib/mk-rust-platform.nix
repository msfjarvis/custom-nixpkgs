{ pkgs }:

let
  mozillaOverlay = pkgs.fetchFromGitHub {
    owner = "mozilla";
    repo = "nixpkgs-mozilla";
    rev = "cbc7435f5b0b3d17b16fb1d20cf7b616eec5e093";
    sha256 = "sha256-LKqAcdL+woWeYajs02bDQ7q8rsqgXuzhC354NoRaV80=";
  };
  date = "2021-11-28";
  channel = "nightly";
  mozilla = pkgs.callPackage "${mozillaOverlay.out}/package-set.nix" { };
  rustSpecific = (mozilla.rustChannelOf { inherit date channel; }).rust;

in pkgs.makeRustPlatform {
  cargo = rustSpecific;
  rustc = rustSpecific;
}
