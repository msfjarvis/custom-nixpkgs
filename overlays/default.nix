self: super: {
  rtl8821ce = super.rtl8821ce.override {
    version = "5.5.2_34066.20200325";
    src = super.fetchFromGitHub {
      owner = "tomaspinho";
      repo = "rtl8821ce";
      rev = "69765eb288a8dfad3b055b906760b53e02ab1dea";
      sha256 = "17jiw25k74kv5lnvgycvj2g1n06hbrpjz6p4znk4a62g136rhn4s";
    };
  };
}
