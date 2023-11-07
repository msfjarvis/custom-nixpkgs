{
  lib,
  stdenvNoCC,
  fetchurl,
}:
stdenvNoCC.mkDerivation rec {
  pname = "bundletool-bin";
  version = "1.15.6";
  src = fetchurl {
    url = "https://github.com/google/bundletool/releases/download/${version}/bundletool-all-${version}.jar";
    hash = "sha256-OK6KELzazvB+zOghEYjFySs3a+lto4/z7h8s9IlbLLg=";
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
    mainProgram = "bundletool";
  };
}
