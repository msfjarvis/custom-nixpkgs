{
  stdenv,
  pkgs,
}:
pkgs.rustPlatform.buildRustPackage rec {
  pname = "file-collector";
  version = "0.2.6";

  src = pkgs.fetchFromGitHub {
    owner = "msfjarvis";
    repo = "file-collector";
    rev = "v${version}";
    sha256 = "sha256-/QLRpi+AlkEPnQkIozOqm5qLvZqaMVXvQ/Z7N43w/sA=";
  };

  buildFeatures = pkgs.lib.optionals stdenv.isLinux ["journald"];
  cargoSha256 = "sha256-fzvH8YXfz9TegHRuiyTQpTc1N7B4lurTzGq1v/kPWjg=";

  meta = with pkgs.lib; {
    description = "Simple CLI tool to watch directories and move their files to a single dumping ground";
    homepage = "https://msfjarvis.dev/g/file-collector";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
