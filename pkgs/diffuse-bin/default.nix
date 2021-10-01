{ lib, fetchzip }:

let version = "0.1.0";
in fetchzip rec {
  name = "diffuse-${version}";

  url =
    "https://github.com/JakeWharton/diffuse/releases/download/${version}/diffuse-${version}-binary.jar";

  sha256 = "0lnmgphjbsbrb4pg1pfvnnb19ngmj3dzj0wxgn84n4phjdhy4h2b";

  postFetch = ''
    mkdir -p $out/bin
    mv -v $downloadedFile $out/bin/diffuse
    chmod +x $out/bin/diffuse
  '';

  meta = with lib; {
    description = "Diffuse is a tool for diffing APKs, AABs, AARs, and JARs";
    homepage = "https://github.com/jakewharton/diffuse";
    license = licenses.asl20;
    platforms = platforms.all;
  };
}
