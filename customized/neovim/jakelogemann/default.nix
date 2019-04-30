{ pkgs ? (import <nixpkgs> {})
, lib ? pkgs.lib
, writeShellScriptBin ? pkgs.writeShellScriptBin
, buildEnv ? pkgs.buildEnv
, neovim ? pkgs.neovim
, ... }:

let
  keybinds = (import ./keybinds { inherit lib pkgs; });
  vimrc = (import ./vimrc { inherit lib pkgs; });
  customConfig = (pkgs.callPackage ./custom-config.nix { inherit lib pkgs; });

  vimrcSnippet = ''
    ${customConfig.vimrcSnippet customConfig}

    " FIXME: DEPRECATED. Keybinds should be migrated ASAP:
    ${keybinds}
  '';

  nixBinScript = fname: (pkgs.writeShellScriptBin "${fname}-nixStorePath" ''
    #! /run/current-system/sw/bin/bash
    realpath $(dirname $(dirname $(readlink $(which nvim))))
  '');

  neovimPkg = (neovim.override {
    withPython3 = true;
    withRuby    = true;
    vimAlias    = true;
    viAlias     = true;
    configure   = {
      customRC  = vimrcSnippet;
      packages  = (import ./vim-packs.nix { inherit lib pkgs; });
    };
  });

in buildEnv {
  name = "customized-neovim-jakelogemann";
  pathsToLink = ["/share" "/bin"];
  ignoreCollisions = true;

  # Prefer this neovim to any others.
  meta.priority = (neovim.meta.priority or 0) - 500;

  paths = with pkgs; [
    (nixBinScript "vim")
    (nixBinScript "nvim")
    customConfig
    neovim-remote
    neovimPkg
    pkgs.python36Packages.neovim
  ];

  passthru = {
    inherit vimrcSnippet;
  };
}

