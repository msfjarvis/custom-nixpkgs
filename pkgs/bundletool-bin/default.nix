{ lib, fetchzip }:

let version = "1.8.2";
in fetchzip rec {
  name = "bundletool-${version}";

  url =
    "https://github.com/google/bundletool/releases/download/${version}/bundletool-all-${version}.jar";

  sha256 = "1w7w60pn9fpmzbszvldm7wnlb4n2ipkgqlib90g83h4zwpjna5sf";

  postFetch = ''
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
