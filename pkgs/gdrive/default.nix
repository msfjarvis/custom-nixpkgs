{
  pkgs,
  lib,
}:
pkgs.buildGo119Module rec {
  pname = "gdrive";
  version = "3.0.13";

  src = pkgs.fetchFromGitHub {
    owner = "msfjarvis";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-FFNgMV3gPQ2p1ilYK+t10UgcNF/knO/PVM3Zw/VSSGw=";
  };

  vendorSha256 = "sha256-WibiLYMeWR63Q8lu287jeczT0n0/lh6T8PfOH7eJh8Q=";

  meta = with lib; {
    description = "GDrive CLI tool";
    homepage = "https://github.com/msfjarvis/gdrive";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
