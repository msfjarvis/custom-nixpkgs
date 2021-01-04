{ lib, fetchzip }:

let version = "2.1.0";
in fetchzip rec {
  name = "JetBrainsMono_NerdFonts-${version}";

  url =
    "https://github.com/ryanoasis/nerd-fonts/releases/download/v${version}/JetBrainsMono.zip";

  sha256 = "0pikmfs9wlmclzk3l8p57jknzv9vgdsyhfzdxsdy709l6yqhavkw";

  postFetch = ''
    mkdir -p $out/share/fonts
    unzip -j $downloadedFile \*.ttf -d $out/share/fonts/truetype
  '';

  meta = with lib; {
    description = "A typeface made for developers; NerdFonts patched edition";
    homepage = "https://jetbrains.com/mono/";
    license = licenses.asl20;
    platforms = platforms.all;
  };
}
