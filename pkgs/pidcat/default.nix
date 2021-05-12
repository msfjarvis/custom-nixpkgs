{ stdenv, fetchFromGitHub, pkgs ? import <nixpkgs> { }, installShellFiles }:

stdenv.mkDerivation rec {
  name = "pidcat";
  version = "2.1.1";
  # I already fixed it in the source
  dontPatchShebangs = 1;

  src = fetchFromGitHub {
    owner = "msfjarvis";
    repo = name;
    rev = "${version}";
    sha256 = "0hbya1ksbp7vdsxa8290gw5sbr7si42hyhikahpd8qi1xmk446y8";
  };

  nativeBuildInputs = [ installShellFiles ];

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
    platform = platforms.all;
  };
}
