{ stdenv, fetchFromGitHub, gnused }:

stdenv.mkDerivation rec {
  name = "pass-clip";
  version = "0.3-pre-1";

  src = fetchFromGitHub {
    owner = "msfjarvis";
    repo = "pass-clip";
    rev = "v${version}";
    sha256 = "1s7vv61rg15h1n9bdhignnkywdvxrq3v059sr3miaxwkhaki0d7d";
  };

  patchPhase = ''
    substituteInPlace clip.bash \
      --replace sed ${gnused}/bin/sed
  '';

  installPhase = ''
    install -D -m755 clip.bash $out/lib/password-store/extensions/clip.bash
  '';

  meta = with stdenv.lib; {
    description =
      "Pass extension that let's you quickly copy passwords using fzf or rofi";
    homepage = "https://github.com/msfjarvis/pass-clip";
    license = licenses.gpl3Plus;
    platforms = platforms.unix;
  };
}
