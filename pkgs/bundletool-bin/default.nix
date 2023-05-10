{
  lib,
  stdenvNoCC,
  fetchurl,
}:
stdenvNoCC.mkDerivation rec {
  pname = "bundletool-bin";
  version = "1.14.1";
  src = fetchurl {
    url = "https://github.com/google/bundletool/releases/download/${version}/bundletool-all-${version}.jar";
    sha256 = "sha256-L3j5yNBZ2xx+pKxv+yUnRmrwODjRULcPS3f+fe78oBE=";
  };

  dontUnpack = true;
  dontBuild = true;
  dontConfigure = true;

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
    maintainers = with maintainers; [msfjarvis];
  };
}
