{ lib, buildGoModule, fetchFromGitHub, installShellFiles }:

buildGoModule rec {
  pname = "gdrive";
  version = "3.0.9";

  src = fetchFromGitHub {
    owner = "msfjarvis";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-JKElNnyfWDKsC/U4tbMXU5Y9YUG+Jd5OmfVoVMWJjG4=";
  };

  vendorSha256 = "sha256-Arx5IucNNw6c8uvJAMNR7Yo1H+XNprSkwFtjW9RdjJA=";
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
