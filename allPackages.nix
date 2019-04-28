{ pkgs ? import <nixpkgs> {}
, lib ? pkgs.lib
, callPackage ? (pkgs.callPackageWith { 
  inherit pkgs lib; 
  overlayName = "fnctlPkgs";
})
, ... }:
{
  customized.vscode.jakelogemann = callPackage ./pkgs/customized/vscode/jakelogemann.nix {};
}
