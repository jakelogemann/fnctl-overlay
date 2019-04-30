{ fetchgit, vimUtils, ... }:

vimUtils.buildVimPlugin {
  name = "ncm2-ultisnips";
  dependencies = [];
  dontBuild = true;
  src = fetchgit {
    url = "https://github.com/ncm2/ncm2-ultisnips.git";
    rev = "15432d7933cfb855599442a67d6f39ddb706c737";
    sha256 = "0ixajh08fd5dgdz4h1sdxgiaind1nksk1d4lwyb6n4ijf672pms2";
    fetchSubmodules = false;
  };
}
