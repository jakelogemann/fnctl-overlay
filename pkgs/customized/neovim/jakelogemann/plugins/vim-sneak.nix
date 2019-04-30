{ pkgs, ... }:
pkgs.vimUtils.buildVimPlugin {
  name = "vim-sneak";
  dependencies = [];
  dontBuild = true;
  src = pkgs.fetchgit {
    url = "https://github.com/justinmk/vim-sneak.git";
    rev = "5d81dcceee9894f433ab16b766db32dcbffef7af";
    sha256 = "0a8nnqahxbwx8j9ac6yzc0qkk7vmaa0ziyd436667h7bih3gq5zj";
    fetchSubmodules = false;
  };
}
