{ fetchgit, vimUtils, ... }:

vimUtils.buildVimPlugin {
  name = "ncm2-syntax";
  dependencies = [];
  dontBuild = true;
  src = fetchgit {
    url = "https://github.com/ncm2/ncm2-syntax.git";
    rev = "aa584c7eb27e09f06d66842d5aa9cfef143ca6b1";
    sha256 = "1h1b2wpwfc9bz0n0j2m6mzss1w6pbvzk5xq6p5w7588i9wys5jpn";
    fetchSubmodules = false;
  };
}
