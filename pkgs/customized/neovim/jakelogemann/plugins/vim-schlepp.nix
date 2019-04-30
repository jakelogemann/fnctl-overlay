{ fetchgit, vimUtils, ... }:

vimUtils.buildVimPlugin {
  name = "vim-schlepp";
  dependencies = [];
  dontBuild = true;
  src = fetchgit {
    url = "https://github.com/zirrostig/vim-schlepp";
    rev = "dfe67ad49d534e6c442d589c558da7b3ab052f03";
    sha256 = "0wd1149k1ryfs97mffhyxm4fdhbfw4xdw23v6i5kc8j8nfy0gnil";
    fetchSubmodules = false;
  };
}
