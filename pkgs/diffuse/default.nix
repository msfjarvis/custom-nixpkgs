{ lib, fetchzip }:

let version = "0.1.0";
in fetchzip rec {
  name = "diffuse-${version}";

  url =
    "https://github.com/JakeWharton/diffuse/releases/download/${version}/diffuse-${version}-binary.jar";

  sha256 = "1srpxkgj6rx9d76zyiqbd9mb9qy6vjai04qj8s8j1qc2gx6s5a3w";

  postFetch = ''
    mkdir -p $out/bin
    mv -v $downloadedFile $out/bin/diffuse
    chmod +x $out/bin/diffuse
  '';

  meta = with lib; {
    description = "A typeface made for developers; NerdFonts patched edition";
    homepage = "https://jetbrains.com/mono/";
    license = licenses.asl20;
  };
}
