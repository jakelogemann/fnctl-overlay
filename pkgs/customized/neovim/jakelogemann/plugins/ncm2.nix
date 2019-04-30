{ fetchgit, vimUtils, ... }:

vimUtils.buildVimPlugin {
  name = "ncm2";
  dependencies = [];
  dontBuild = true;
  src = fetchgit {
    url = "https://github.com/ncm2/ncm2.git";
    rev = "c1f726bb9873acda499580be25c2690a111a56a5";
    sha256 = "1rx41j0mm1v5xpfbdsrhn5n77axc23817l80sa4lz2fmdnmxgwi9";
    fetchSubmodules = false;
  };
}
