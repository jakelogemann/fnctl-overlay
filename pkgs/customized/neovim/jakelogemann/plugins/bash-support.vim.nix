{ fetchgit, vimUtils, ... }:

vimUtils.buildVimPlugin {
  name = "bash-support.vim";
  dependencies = [];
  dontBuild = true;
  src = fetchgit {
    url = "https://github.com/vim-scripts/bash-support.vim";
    rev = "309d6fe45859f2d30d0e8fe8016ca69f03b9f7d6";
    sha256 = "1fs8w5zhg13c1nj49xrycc0csn0rjm244816yyc627zq7vk8psga";
    fetchSubmodules = false;
  };
}
