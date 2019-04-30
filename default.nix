# NixOS Overlay containing the defined functions.
self: super: with super;

{ fnctlPkgs = with super; {

  customized.vscode = {
    jakelogemann = callPackage ./customized/vscode/jakelogemann.nix {};
  };

  customized.neovim = {
    jakelogemann = callPackage ./customized/neovim/jakelogemann {};
  };

}; }
