{
  lib,
  rustPlatform,
  fetchFromGitHub,
}:
rustPlatform.buildRustPackage rec {
  pname = "hyperlink";
  version = "0.1.30";

  src = fetchFromGitHub {
    owner = "untitaker";
    repo = "hyperlink";
    rev = version;
    hash = "sha256-A/zIn5Z8z/+Maym3MCDKro4hdd9N69DtJel+SgV1RIk=";
  };

  cargoHash = "sha256-ePzXQQxqyVbk7KfzMwKVbwkUcsEKPddhg/HoKC01qww=";

  meta = with lib; {
    description = "Very fast link checker for CI";
    homepage = "https://github.com/untitaker/hyperlink";
    license = licenses.mit;
    maintainers = with maintainers; [msfjarvis];
  };
}
