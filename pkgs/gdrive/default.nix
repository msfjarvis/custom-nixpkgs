{ lib, buildGo118Module, fetchFromGitHub }:

buildGo118Module rec {
  pname = "gdrive";
  version = "3.0.11";

  src = fetchFromGitHub {
    owner = "msfjarvis";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-NVAa33lyqtvqpVT5/MzyI8k6bJVfnqxhjKf+BwpXCWU=";
  };

  vendorSha256 = "sha256-2ozu7fGuGFGypddtU+2I39yBA8swSFnGgBd0ScCWucE=";

  meta = with lib; {
    description = "GDrive CLI tool";
    homepage = "https://github.com/msfjarvis/gdrive";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
