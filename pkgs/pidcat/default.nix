with import <nixpkgs> {};

stdenv.mkDerivation rec {
  name = "pidcat";
  version = "2.1.1";

  src = fetchFromGithub {
    owner = "msfjarvis";
    repo = "pidcat";
    rev = "2.1.1";
    sha256 = "0hbya1ksbp7vdsxa8290gw5sbr7si42hyhikahpd8qi1xmk446y8";
  };

  installPhase = ''
    install -m755 -D pidcat.py $out/bin/pidcat
  '';

  meta = with stdenv.lib; {
    homepage = "https://github.com/JakeWharton/pidcat";
    description = "pidcat - colored logcat script";
    platforms = platforms.linux;
  };
}
