{ fetchgit, vimUtils, ... }:

vimUtils.buildVimPlugin {
  name = "gina.vim";
  dependencies = [];
  dontBuild = true;
  src = fetchgit {
    url = "https://github.com/lambdalisue/gina.vim";
    rev = "eb5561d4942f2a9596327331e45e418e11d979a3";
    sha256 = "1jfwlz8lnj6ds4kz16f4qvfpkcqf169xbd10iaswa39rn8jfbf03";
    fetchSubmodules = false;
  };
}
