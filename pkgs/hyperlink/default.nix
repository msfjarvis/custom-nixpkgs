{
  lib,
  rustPlatform,
  fetchFromGitHub,
}:
rustPlatform.buildRustPackage rec {
  pname = "hyperlink";
  version = "0.1.29";

  src = fetchFromGitHub {
    owner = "untitaker";
    repo = "hyperlink";
    rev = version;
    hash = "sha256-XwMEKS+xU0/NLNhVi3DNuop4Z67UVQ1a1qMTv5cn57M=";
  };

  cargoHash = "sha256-a6+s+0A1+dWjxgHfJFYfJ+/hDjsghxrSZNNqhsP4UKw=";

  meta = with lib; {
    description = "Very fast link checker for CI";
    homepage = "https://github.com/untitaker/hyperlink";
    license = licenses.mit;
    maintainers = with maintainers; [msfjarvis];
  };
}
