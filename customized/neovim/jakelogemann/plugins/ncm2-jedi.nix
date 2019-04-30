{ fetchgit, vimUtils, ... }:

vimUtils.buildVimPlugin {
  name = "ncm2-jedi";
  dependencies = [];
  dontBuild = true;
  src = fetchgit {
    url = "https://github.com/ncm2/ncm2-jedi.git";
    rev = "0418d5ca8d4fe6996500eb04517a946f7de83d34";
    sha256 = "1rbwxsycrn3nis9mj08k70hb174z7cw9p610r6nd8lv4zk1h341z";
    fetchSubmodules = false;
  };
}
