{ lib, fetchzip }:

let version = "1.10.0";
in fetchzip rec {
  name = "bundletool-${version}";

  url =
    "https://github.com/google/bundletool/releases/download/${version}/bundletool-all-${version}.jar";

  sha256 = "sha256-hp1wf0skWqJcwfygUBayEDTqPfgtEYhk7wWYcfF6+tk=";

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
