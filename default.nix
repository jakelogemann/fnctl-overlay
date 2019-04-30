# NixOS Overlay containing the defined functions.
self: super: with pkgs;

{ fnctlPkgs = with super; {

  customized.vscode = {
    jakelogemann = callPackage ./pkgs/customized/vscode/jakelogemann.nix {};
  };

}; }
