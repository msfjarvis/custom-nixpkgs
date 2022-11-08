{ lib, buildGo118Module, fetchFromGitHub }:

buildGo118Module rec {
  pname = "gdrive";
  version = "3.0.12";

  src = fetchFromGitHub {
    owner = "msfjarvis";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-50UchzfAsALt4D9L1EtUWiFUfY7OYQ/Uv0KoeDs0xzo=";
  };

  vendorSha256 = "sha256-TX0uGtyiygmOudY8zfgKqYAjFOWYiW3XOw9GaOMaW6o=";

  meta = with lib; {
    description = "GDrive CLI tool";
    homepage = "https://github.com/msfjarvis/gdrive";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
