{ fetchgit, vimUtils, ... }:

vimUtils.buildVimPlugin {
  name = "rainbow";
  dependencies = [];
  dontBuild = true;
  src = fetchgit {
    url = "https://github.com/luochen1990/rainbow";
    rev = "d7bb89e6a6fae25765ee16020ea7a85d43bd6e41";
    sha256 = "0zh2x1bm0sq00gq6350kckjl1fhwqdxl3b8d3k9lb1736xggd1p8";
    fetchSubmodules = false;
  };
}
