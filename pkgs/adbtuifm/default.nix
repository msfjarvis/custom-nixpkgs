{
  pkgs,
  lib,
}:
pkgs.buildGo119Module rec {
  pname = "adbtuifm";
  version = "0.5.8";

  src = pkgs.fetchFromGitHub {
    owner = "darkhz";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-TK93O9XwMrsrQT3EG0969HYMtYkK0a4PzG9FSTqHxAY=";
  };

  vendorSha256 = "sha256-voVoowjM90OGWXF4REEevO8XEzT7azRYiDay4bnGBks=";

  meta = with lib; {
    description = "A TUI File Manager for ADB";
    homepage = "https://github.com/darkhz/adbtuifm";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
