NixPkgs Overlay
===============

> _"Just add `<nixpkgs>`."_

Collection of custom Nix/NixOS packages that may be useful. Each file/directory
in `./pkgs/` corresponds to a package exported by this overlay.

**Can be used as NixPkgs Overlay**:
```nix
with (import <nixpkgs> {
  # config = []; 
  overlays = [
    /path/to/overlay
  ];
});
```

**Can be used in NixOS Overlays**:
```nix
{ config, pkgs, lib, options, ... }:
{
  nixpkgs.overlays = lib.mkBefore [
    /path/to/overlay
  ];
}
```
Contributing
------------

**Packages MUST** (_at least strive for, kinda?_):
- Serve as well as documentation as they do code.
- Be documented extensively. Seriously, get that?
- Use verbose variable names for clarity where ever its reasonable.
- Strive to keep functions as generic as possible.

The packages should be documented extensively and their functions
should be kept simple, minimal and verifiable. Variable names should
strive to be clear for external users' consumption. This repo can serve
as a reference, or a cheatsheet.

**There are not tests yet, but we should obviously add them.**
