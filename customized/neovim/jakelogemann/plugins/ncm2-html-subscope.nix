{ fetchgit, vimUtils, ... }:

vimUtils.buildVimPlugin {
  name = "ncm2-html-subscope";
  dependencies = [];
  dontBuild = true;
  src = fetchgit {
    url = "https://github.com/ncm2/ncm2-html-subscope.git";
    rev = "8294cf1bb55fb805454a9230aeb91dbb0f733a14";
    sha256 = "19h1jjqv6jwv5fnxxa6gv0qiyc3rbnxf0zibqxzdclmskrdgjacq";
    fetchSubmodules = false;
  };
}
