# NixOS Overlay containing the defined functions.
self: super: with super;

{ fnctlPkgs = with super; {

  customized.vscode = {
    jakelogemann = callPackage ./pkgs/customized/vscode/jakelogemann.nix {};
  };

}; }
