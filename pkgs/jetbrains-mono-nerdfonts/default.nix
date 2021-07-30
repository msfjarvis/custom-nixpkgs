{ lib, fetchzip }:

let version = "2.4.2";
in fetchzip rec {
  name = "JetBrainsMono_NerdFonts-${version}";

  url =
    "https://github.com/msfjarvis/random-bits-and-pieces/releases/download/JetBrainsMono-2.242-NerdFonts/JetBrainsMono-2.242-NerdFonts.zip";

  sha256 = "sha256-LbxpswJ4ju793Ojwj3g5Dwf7NbDSEDtY2eUBhPSxJvo=";

  postFetch = ''
    mkdir -p $out/share/fonts
    unzip -j $downloadedFile \*.ttf -d $out/share/fonts/truetype
  '';

  meta = with lib; {
    description = "A typeface made for developers; NerdFonts patched edition";
    homepage = "https://jetbrains.com/mono/";
    license = licenses.asl20;
    platform = platforms.linux;
  };
}
