{ fetchgit, vimUtils, ... }:

vimUtils.buildVimPlugin {
  name = "nvim-yarp";
  dependencies = [];
  dontBuild = true;
  src = fetchgit {
    url = "https://github.com/roxma/nvim-yarp.git";
    rev = "52317ced0e16f226f0d44878917d0b5f4657b4d4";
    sha256 = "1xj1n9x1nxjbbpp29x5kkwr0bxziwzn8n2b8z9467hj9w646zyrj";
    fetchSubmodules = false;
  };
}
