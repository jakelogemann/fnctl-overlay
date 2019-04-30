{ pkgs, ... }:
pkgs.vimUtils.buildVimPlugin {
  name = "vim-anyfold";
  dependencies = [];
  dontBuild = true;
  src = pkgs.fetchgit {
    url = "https://github.com/pseewald/vim-anyfold.git";
    rev = "123f2fff78d49d68c96000af4600c1764871c58f";
    sha256 = "1g50ws6bx9sgjs1fi1z7illdvfdxi79dl5vm34qznp4cr6rw8wwd";
    fetchSubmodules = false;
  };
}
