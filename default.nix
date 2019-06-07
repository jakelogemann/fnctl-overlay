# NixOS Overlay containing the defined functions.
self: super: with super;

{ fnctlPkgs = with super; {

  gnvim = callPackage ./gui-tools/gnvim.nix {};

  customized.vscode = {
    jakelogemann = callPackage ./customized/vscode/jakelogemann.nix {};
    christine    = callPackage ./customized/vscode/christine.nix {};
  };

  customized.neovim = {
    jakelogemann = callPackage ./customized/neovim/jakelogemann {};
  };

}; }
