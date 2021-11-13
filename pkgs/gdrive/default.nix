{ lib, buildGoModule, fetchFromGitHub, installShellFiles }:

buildGoModule rec {
  pname = "gdrive";
  version = "3.0.7";

  src = fetchFromGitHub {
    owner = "msfjarvis";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-zZXJyity4kXWDs9Lzitvbi/PuLQLYOZBSdGPJc3b1iY=";
  };

  vendorSha256 = "sha256-yXMJPpg10VT3YZwfl0krgjHpz/7JP1wWPowGcQJ/ZD0=";
  clientId = lib.fakeSha256;
  clientSecret = lib.fakeSha256;

  buildPhase = ''
    go build -ldflags "-X main.ClientId=${clientId} -X main.ClientSecret=${clientSecret}"
  '';

  installPhase = ''
    install -Dm755 gdrive -t $out/bin
  '';

  # has no tests
  doCheck = false;

  meta = with lib; {
    description = "GDrive CLI tool";
    homepage = "https://github.com/msfjarvis/gdrive";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
