{ pkgs ? import <nixpkgs> {}, lib ? pkgs.lib, ... }:

let
  callPackage = (import ./pkgs/callPackage.nix { inherit pkgs lib; });

in {
  # foo = callPackage ./pkgs/foo {};
}
