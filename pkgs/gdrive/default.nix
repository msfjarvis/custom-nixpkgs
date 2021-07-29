{ lib, fetchFromGitHub, buildGoModule, installShellFiles }:

buildGoModule rec {
  pname = "gdrive";
  version = "3.0.3";

  src = fetchFromGitHub {
    owner = "msfjarvis";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-KhPCKzkIyWhFF6NLRyx7wsEWgIvp5i/SofO6WMsbpTk=";
  };

  vendorSha256 = "sha256-YrsylvcbUSqNFfcoidagNX2UqO9NjpIcvP/yiyetZe0=";
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
    platform = platforms.all;
  };
}
