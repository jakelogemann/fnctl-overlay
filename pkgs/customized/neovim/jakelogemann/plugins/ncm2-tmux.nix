{ fetchgit, vimUtils, ... }:

vimUtils.buildVimPlugin {
  name = "ncm2-tmux";
  dependencies = [];
  dontBuild = true;
  src = fetchgit {
    url = "https://github.com/ncm2/ncm2-tmux.git";
    rev = "4f60ee1be57531295075d808e0006c83894096d1";
    sha256 = "1ihbm65b9bc0y068w6r0k8f9lsc3603npb55chcchpj7z75539yh";
    fetchSubmodules = false;
  };
}
