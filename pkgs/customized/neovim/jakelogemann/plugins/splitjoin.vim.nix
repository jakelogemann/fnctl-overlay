{ fetchgit, vimUtils, ... }:

vimUtils.buildVimPlugin {
  name = "splitjoin.vim";
  dependencies = [];
  dontBuild = true;
  src = fetchgit {
    url = "https://github.com/AndrewRadev/splitjoin.vim";
    rev = "c38e4847c88de0be2184e52676ff6e510add4c89";
    sha256 = "1yl035g7qf4kbxzpllq4fp6aagxfg5k6nnyli2yrajz0jllm19fn";
    fetchSubmodules = false;
  };
}
