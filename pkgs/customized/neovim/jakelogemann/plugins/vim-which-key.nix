{ fetchgit, vimUtils, ... }:

vimUtils.buildVimPlugin {
  name = "vim-which-key";
  dependencies = [];
  dontBuild = true;
  src = fetchgit {
    url = "https://github.com/liuchengxu/vim-which-key";
    rev = "fc8a0e1c4876a79ec54d6b86b992c7a510aaee98";
    sha256 = "1qlf9y937w17wfi2bj3kz2bfk1fn9gg1c6ph4bg1835k4f0xkhpb";
    fetchSubmodules = false;
  };
}
