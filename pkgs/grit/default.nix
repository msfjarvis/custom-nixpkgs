{ lib, fetchFromGitHub, buildGoModule, installShellFiles }:

buildGoModule rec {
  pname = "grit";
  version = "0.2.0";

  src = fetchFromGitHub {
    owner = "climech";
    repo = "grit";
    rev = "v${version}";
    sha256 = "0v4i8xdf1pgkmwad5jb6n6s4rx48zk57wij0ppzg6zb725wy7r8a";
  };

  vendorSha256 = "0a1lqfn710fgvrvbimd92102fhjs1wa7r8i0l7s5m7jxks629hw8";

  buildPhase = ''
    export CWD=$(pwd)
    go build -v -ldflags "-s -w -X 'github.com/climech/grit/app.Version=${version}'" "$CWD/cmd/grit"
  '';

  installPhase = ''
    install -Dm755 grit -t $out/bin
  '';

  meta = with lib; {
    description = "A multitree-based personal task manager";
    homepage = "https://github.com/climech/grit";
    license = licenses.mit;
  };
}
