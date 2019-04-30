{ pkgs, ... }: pkgs.vimPlugins // {

  gina                   = pkgs.callPackage ./gina.vim.nix {};
  gitv                   = pkgs.callPackage ./gitv.nix {};
  ncm2                   = pkgs.callPackage ./ncm2.nix {};
  ncm2-path              = pkgs.callPackage ./ncm2-path.nix {};
  ncm2-bufword           = pkgs.callPackage ./ncm2-bufword.nix {};
  ncm2-tmux              = pkgs.callPackage ./ncm2-tmux.nix {};
  ncm2-ultisnips         = pkgs.callPackage ./ncm2-ultisnips.nix {};
  ncm2-vim               = pkgs.callPackage ./ncm2-vim.nix {};
  splitjoin              = pkgs.callPackage ./splitjoin.vim.nix {};
  plug                   = pkgs.callPackage ./vim-plug.nix {};
  schlepp                = pkgs.callPackage ./vim-schlepp.nix {};
  ncm2-syntax            = pkgs.callPackage ./ncm2-syntax.nix {};
  ncm2-jedi              = pkgs.callPackage ./ncm2-jedi.nix {};
  ncm2-html-subscope     = pkgs.callPackage ./ncm2-html-subscope.nix {};
  ncm2-markdown-subscope = pkgs.callPackage ./ncm2-markdown-subscope.nix {};
  nvim-yarp              = pkgs.callPackage ./nvim-yarp.nix {};
  vim-snippets           = pkgs.callPackage ./vim-snippets.nix {};
  tcomment               = pkgs.callPackage ./tcomment.nix {};
  vim-anyfold            = pkgs.callPackage ./vim-anyfold.nix {};
  vim-docker-tools       = pkgs.callPackage ./vim-docker-tools.nix {};
  vim-sneak              = pkgs.callPackage ./vim-sneak.nix {};
  vader                  = pkgs.callPackage ./vader.vim.nix {};
  bash-support           = pkgs.callPackage ./bash-support.vim.nix {};
  rainbow                = pkgs.callPackage ./rainbow.nix {};
  vim-which-key          = pkgs.callPackage ./vim-which-key.nix {};

}
