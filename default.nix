# NixOS Overlay containing the defined functions.
self: super: import ./allPackages.nix {
  pkgs = super;
  lib = super.lib;
}
