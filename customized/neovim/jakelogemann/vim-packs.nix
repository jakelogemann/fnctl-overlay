{ pkgs, lib, ... }:

let
  mkVimPack = { start ? [], opt ? [] }@p: p;
  vimPlugs = (import ./plugins {inherit pkgs;});

in with vimPlugs; {

  myVimPackage = mkVimPack {
    start = [
      vim-which-key
      rainbow
      bash-support
      Gundo
      LanguageClient-neovim
      Tabular
      Tagbar
      airline
      ale
      auto-pairs
      denite
      denite-extra
      denite-git
      dhall-vim
      echodoc
      editorconfig-vim
      # fugitive
      splitjoin
      plug
      schlepp
      gina
      vim-racer
      # gitv
      goyo
      gruvbox
      limelight-vim
      multiple-cursors
      neomake
      neomru
      polyglot
      prettyprint
      repeat
      surround
      tcomment
      vim-airline-themes
      vim-expand-region
      vim-anyfold
      vim-devicons
      vim-eunuch
      vim-highlightedyank
      vim-indent-guides
      vim-indent-object
      vim-json
      vim-peekaboo
      vim-racer
      vim-sneak
      vim-speeddating
      vim-startify
      vim-scriptease
      vimwiki
      vinegar
      vader
      webapi-vim

      ncm2
      ncm2-bufword
      ncm2-html-subscope
      ncm2-jedi
      ncm2-markdown-subscope
      ncm2-path
      ncm2-syntax neco-syntax
      ncm2-tmux
      ncm2-ultisnips
      ncm2-vim
      ncm2-vim neco-vim
      nvim-yarp
      ultisnips vim-snippets

    ];

    opt = [
      vim-docker-tools
    ];
  };
}
