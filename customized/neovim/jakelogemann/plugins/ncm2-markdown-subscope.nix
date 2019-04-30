{ fetchgit, vimUtils, ... }:

vimUtils.buildVimPlugin {
  name = "ncm2-markdown-subscope";
  dependencies = [];
  dontBuild = true;
  src = fetchgit {
    url = "https://github.com/ncm2/ncm2-markdown-subscope.git";
    rev = "999ca17de0c31dd92669fb611dfd888c2dd04bc1";
    sha256 = "0iy2z4gd4iq1hq2iqrjm3phbn34wsl6iy89m54d7r9hh38xacana";
    fetchSubmodules = false;
  };
}
