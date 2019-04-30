{ fetchgit, vimUtils, ... }:

vimUtils.buildVimPlugin {
  name = "ncm2-path";
  dependencies = [];
  dontBuild = true;
  src = fetchgit {
    url = "https://github.com/ncm2/ncm2-path.git";
    rev = "875ae47e171abc2ba6710bb835727bed46d7b329";
    sha256 = "09vhggrb1nigr8p53gd9ibn3b84dh9yix2ndj2453wnq8ny9x2dc";
    fetchSubmodules = false;
  };
}
