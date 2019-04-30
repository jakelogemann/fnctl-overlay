{ pkgs, ... }:

pkgs.vimUtils.buildVimPlugin {
  name = "vim-docker-tools";
  dependencies = [];
  dontBuild = true;
  src = pkgs.fetchgit {
    url = "https://github.com/kevinhui/vim-docker-tools";
    rev = "1c626e5226077244ed17ef4f0c255deff944c2b2";
    sha256 = "0xg6yskap2g49z30gkasdmw2w8mr7yqlfq5mraa4yqq54gqbj738";
    fetchSubmodules = false;
  };
}
