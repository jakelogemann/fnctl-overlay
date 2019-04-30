{pkgs
, lib
, ... }:

let
  vimDir = "share/fnctl/neovim";

in pkgs.stdenv.mkDerivation {
  name             = "FnCtl-NeoVimConfig";
  pathsToLink      = ["/share"];
  ignoreCollisions = true;
  src              = ./config;
  doBuild          = false;
  doCheck          = false;
  buildInputs      = [];
  installPhase     = ''
    o=$out/${vimDir}
    mkdir -p $o
    mv ./* $o/
  '';

  passthru = {
    vimrcSnippet = pkgPath: ''
      source ${pkgPath}/${vimDir}/init.vim
    '';
  };
}

