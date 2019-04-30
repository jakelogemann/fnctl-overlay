{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  paths = (with pkgs; [
    bashInteractive
    (callPackage ./default.nix {})
  ]);
}
