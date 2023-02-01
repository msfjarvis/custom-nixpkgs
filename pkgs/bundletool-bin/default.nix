{
  pkgs,
  lib,
}:
pkgs.stdenv.mkDerivation rec {
  pname = "bundletool-bin";
  version = "1.14.0";
  src = pkgs.fetchurl {
    url = "https://github.com/google/bundletool/releases/download/${version}/bundletool-all-${version}.jar";
    sha256 = "sha256-50Dn04VixejYfMgXVIstuU5CgC6aB3T99nTnWP95aU0=";
  };

  dontUnpack = true;

  installPhase = ''
    mkdir -p $out/bin
    printf "#!/bin/sh\n\nexec java \$JAVA_OPTS -jar \$0 \"\$@\"\n" > $out/bin/bundletool
    cat $src >> $out/bin/bundletool
    chmod +x $out/bin/bundletool
  '';

  meta = with lib; {
    description = "Bundletool is a command-line tool to manipulate Android App Bundles";
    homepage = "https://g.co/androidappbundle";
    license = licenses.asl20;
    platforms = platforms.all;
  };
}
