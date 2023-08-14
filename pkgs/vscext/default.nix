{
  lib,
  stdenvNoCC,
  fetchurl,
  curl,
  jq,
  unzip,
}:
stdenvNoCC.mkDerivation rec {
  pname = "vscext";
  version = "1.0.0";

  src = fetchurl {
    url = "https://raw.githubusercontent.com/NixOS/nixpkgs/master/pkgs/applications/editors/vscode/extensions/update_installed_exts.sh";
    hash = "sha256-W1MwcMuzvxrblhfjkk/ulNnwRAyeQK16dKCdbY5v64U=";
  };

  patch = ./exec.patch;

  outputs = ["out"];

  buildInputs = [curl jq unzip];

  dontConfigure = true;
  dontUnpack = true;
  dontBuild = true;

  installPhase = ''
    mkdir -p $out/bin/
    install -m755 $src $out/bin/vscext
    patch -p1 $out/bin/vscext $patch
  '';

  meta = with lib; {
    homepage = "https://github.com/msfjarvis/dotfiles";
    description = "vscext is a small shell script that takes in a list of VSCode extension IDs to generate Nix-compatible data inputs from them";
    license = licenses.cc0;
    platforms = platforms.all;
    maintainers = with maintainers; [msfjarvis];
    mainProgram = "vscext";
  };
}
