{ pkgs, ... }:

pkgs.vimUtils.buildVimPlugin {
  name = "tcomment";
  dependencies = [];
  dontBuild = true;
  src = pkgs.fetchgit {
    url = "https://github.com/tomtom/tcomment_vim.git";
    rev = "eea1a7cac22ab647ace37f27b2a2dfd83bad723a";
    sha256 = "082dfsv6rb37lzvx2kv1fzm301kbaqdk9mk8ggl0sq6d248jy9s4";
    fetchSubmodules = false;
  };
}
