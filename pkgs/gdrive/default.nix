{ lib, buildGo118Module, fetchFromGitHub }:

buildGo118Module rec {
  pname = "gdrive";
  version = "3.0.10";

  src = fetchFromGitHub {
    owner = "msfjarvis";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-l5TAspkXVcLkl/YFpQYWidPwKOWYFl/JiEIbmKwJWU8=";
  };

  vendorSha256 = "sha256-Mcnoi3xMAzVQsllxAOpRJzgtnQO4BY9j+kOPEh1Z/nw=";

  meta = with lib; {
    description = "GDrive CLI tool";
    homepage = "https://github.com/msfjarvis/gdrive";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
