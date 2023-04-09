{
  pkgs,
  lib,
}:
pkgs.stdenv.mkDerivation rec {
  pname = "monocraft-nerdfonts";
  version = "2.4";
  src = pkgs.fetchurl {
    url = "https://github.com/IdreesInc/Monocraft/releases/download/v${version}/Monocraft-nerd-fonts-patched.ttf";
    sha256 = "sha256-QxMp8UwcRjWySNHWoNeX2sX9teZ4+tCFj+DG41azsXw=";
  };

  dontBuild = true;
  dontUnpack = true;

  installPhase = ''
    mkdir -p $out/share/fonts/truetype/
    cat $src > $out/share/fonts/truetype/Monocraft-nerdfonts.ttf
  '';

  meta = with lib; {
    description = "A monospaced programming font inspired by the Minecraft typeface";
    homepage = "https://github.com/IdreesInc/Monocraft";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}