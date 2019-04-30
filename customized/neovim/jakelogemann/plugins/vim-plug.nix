{ fetchgit, vimUtils, ... }:

vimUtils.buildVimPlugin {
  name = "vim-plug";
  dependencies = [];
  dontBuild = true;
  src = fetchgit {
    url = "https://github.com/junegunn/vim-plug";
    rev = "0a255ee62da085a01ab376fd69a97e0e26df4da0";
    sha256 = "1b868k047b6zc56lqbwi39lyz5waavsgdsq6p6lb5i3b08bdkfnv";
    fetchSubmodules = false;
  };
}
