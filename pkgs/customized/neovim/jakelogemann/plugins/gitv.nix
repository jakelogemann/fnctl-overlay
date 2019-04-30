{ pkgs, ... }:
pkgs.vimUtils.buildVimPlugin {
  name = "gitv";
  dependencies = [];
  dontBuild = true;
  src = pkgs.fetchgit {
    url = "https://github.com/gregsexton/gitv.git";
    rev = "41e4ffdbdb02374412d03c5680906ebee84dd5a2";
    sha256 = "1wfp3kkcvrccq0dqplg3ymyz9vdwn1c5wabh6mwfzbs2zx01vwcn";
    fetchSubmodules = false;
  };
}
