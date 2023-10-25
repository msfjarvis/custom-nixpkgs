{
  lib,
  buildGoModule,
  fetchFromGitea,
}:
buildGoModule rec {
  pname = "tea";
  version = "dev-897dc50bfea08321a9af095d8051a03b2fa8c861";

  src = fetchFromGitea {
    domain = "gitea.com";
    owner = "gitea";
    repo = "tea";
    rev = "897dc50bfea08321a9af095d8051a03b2fa8c861";
    hash = "sha256-0x37aPIWDBpqv0vHcKqnHagI+wYKFzv/pi+6WlH4lPA=";
  };

  vendorHash = "sha256-rQqx1i5bDT7EWMo0Ikapwx1vI0bifOSSyvZz7OTpVgo=";

  ldflags = [
    "-s"
    "-w"
    "-X=main.Version=${version}"
  ];

  meta = with lib; {
    description = "A command line tool to interact with Gitea servers";
    homepage = "https://gitea.com/gitea/tea";
    license = licenses.mit;
    maintainers = with maintainers; [];
  };
}
