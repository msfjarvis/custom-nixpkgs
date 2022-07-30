{ stdenv, fetchFromGitHub, rustPlatform, pkgs ? import <nixpkgs> { } }:

rustPlatform.buildRustPackage rec {
  pname = "lurk";
  version = "0.2.7";

  src = fetchFromGitHub {
    owner = "JakWai01";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-+wLQibZ0bmMGzm4gulJQQAC0PfCPcWsRwPrndl5W+W0=";
  };

  cargoSha256 = "sha256-ASoFHre2Gh7SgzhnkZcNQZgiPwM4allcIy8lRP0AP6k=";

  meta = with pkgs.lib; {
    description = "A pretty (simple) alternative to strace";
    homepage = "https://github.com/JakWai01/lurk";
    license = licenses.agpl3Only;
    platforms = platforms.linux;
    broken = stdenv.isDarwin;
  };
}
