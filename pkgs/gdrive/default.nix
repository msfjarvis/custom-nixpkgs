{ lib, fetchFromGitHub, buildGoModule, installShellFiles }:

buildGoModule rec {
  pname = "gdrive";
  version = "3.0.1";

  src = fetchFromGitHub {
    owner = "msfjarvis";
    repo = "gdrive";
    rev = "v${version}";
    sha256 = "1450lgzaj8gmzc6zim912cjkf16v1hi8p6xwj0dvvl91jc0mgv26";
  };

  vendorSha256 = "0bn2a9liv0iq8k6vs6kzkx7qx3ry1zga1a5xiywh7vs90x8177bn";
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
  };
}
