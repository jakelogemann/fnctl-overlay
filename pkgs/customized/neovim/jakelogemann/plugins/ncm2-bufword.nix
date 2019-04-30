{ fetchgit, vimUtils, ... }:

vimUtils.buildVimPlugin {
  name = "ncm2-bufword";
  dependencies = [];
  dontBuild = true;
  src = fetchgit {
    url = "https://github.com/ncm2/ncm2-bufword.git";
    rev = "86a92eb3fb217f9ea1e93f890b7e5e0eb1671ca9";
    sha256 = "02f43rr9apgcjpz4ipnin4v3cvdlx931a0787x87iyr8a0aljg3y";
    fetchSubmodules = false;
  };
}
