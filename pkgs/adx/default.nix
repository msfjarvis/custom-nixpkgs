with import <nixpkgs> {};

rustPlatform.buildRustPackage rec {
  pname = "adx";
  version = "2.1.1";

  src = fetchFromGitHub {
    owner = "msfjarvis";
    repo = "androidx-release-watcher";
    rev = "v${version}";
    sha256 = "0dvm14np9x7y415jj0xgfmajp6gzq3i43wvdyzf51s9cr2wxmgw1";
  };

  cargoSha256 = "1q7lywhxchc0sqsw6w39jkvpm959gvqlklizwmq53z986z69rncm";

  meta = with stdenv.lib; {
    description =
      "Rust binary that polls Google's Maven repository and extracts the latest version of all dependencies, with as few network calls as possible.";
    homepage = "https://github.com/msfjarvis/androidx-release-watcher";
    license = licenses.mit;
    platforms = platforms.unix;
  };
}
