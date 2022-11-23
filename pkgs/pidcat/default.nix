{ stdenv, pkgs }:

stdenv.mkDerivation rec {
  pname = "pidcat";
  version = "2.2.0";
  # I already fixed it in the source
  dontPatchShebangs = 1;

  src = pkgs.fetchFromGitHub {
    owner = "msfjarvis";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-VOIND2CzWo+LV84C+FbTC0r3FqY7VpBaWn95IKTYFT8=";
  };

  nativeBuildInputs = [ pkgs.installShellFiles ];

  postInstall = ''
    installShellCompletion --bash bash_completion.d/pidcat
  '';

  installPhase = ''
    install -m755 -D pidcat.py $out/bin/pidcat
  '';

  meta = with pkgs.lib; {
    homepage = "https://github.com/JakeWharton/pidcat";
    description = "pidcat - colored logcat script";
    license = licenses.asl20;
    platforms = platforms.all;
  };
}
