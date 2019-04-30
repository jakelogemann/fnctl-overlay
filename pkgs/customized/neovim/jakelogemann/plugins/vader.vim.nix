{ fetchgit, vimUtils, ... }:

vimUtils.buildVimPlugin {
  name = "vader.vim";
  dependencies = [];
  dontBuild = true;
  src = fetchgit {
    url = "https://github.com/junegunn/vader.vim";
    rev = "e30d7d06f78a508e58fb8fb10d1c75d591fc4202";
    sha256 = "0xsmhba4jpw6c5w6c1l8qkp24adhb0j2p4x4bqw5h4xpljqyp22v";
    fetchSubmodules = false;
  };
}
