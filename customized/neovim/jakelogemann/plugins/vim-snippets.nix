{ fetchgit, vimUtils, ... }:

vimUtils.buildVimPlugin {
  name = "vim-snippets";
  dependencies = [];
  dontBuild = true;
  src = fetchgit {
    url = "https://github.com/honza/vim-snippets.git";
    rev = "1143432afdb3a97b606b081700eead5b4f499d4d";
    sha256 = "1z0pgpsv8y1zhxlm6w76wgd4wx378wbq44mvgxxfxi0mfvb6vywf";
    fetchSubmodules = false;
  };
}
