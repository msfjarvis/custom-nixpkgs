{ pkgs, lib }:

pkgs.stdenv.mkDerivation rec {
  pname = "bundletool-bin";
  version = "1.12.1";
  src = pkgs.fetchurl {
    url =
      "https://github.com/google/bundletool/releases/download/${version}/bundletool-all-${version}.jar";
    sha256 = "sha256-yn8Nz2f0UffzTrI+g1MoDpOYj7frq6/US86auYkcs3I=";
  };

  dontUnpack = true;

  installPhase = ''
    mkdir -p $out/bin
    printf "#!/bin/sh\n\nexec java \$JAVA_OPTS -jar \$0 \"\$@\"\n" > $out/bin/bundletool
    cat $downloadedFile >> $out/bin/bundletool
    chmod +x $out/bin/bundletool
  '';

  meta = with lib; {
    description =
      "Bundletool is a command-line tool to manipulate Android App Bundles";
    homepage = "https://g.co/androidappbundle";
    license = licenses.asl20;
    platforms = platforms.all;
  };
}
