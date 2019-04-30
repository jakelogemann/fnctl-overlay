NixPkgs Overlay
===============

> _"Just add `<nixpkgs>`."_

Collection of custom Nix/NixOS packages that may be useful. Each file/directory
in `./pkgs/` corresponds to a package exported by this overlay.

**Directly as NixOS module OR NixOS overlay**:

_USE ONLY **ONE** of the TWO (2) options below._

```nix
{ config, pkgs, lib, options, ... }: {
 # -----------------
 # (1) Add this to add it as an overlay, this avoids adding it to `nix.nixPath`.
 # nixpkgs.overlays = [ /path/to/overlay ];
 # -----------------
 # (2) Add this to add it as a module, this adds it to `nix.nixPath` as
 # `<fnctlPkgs>` for easy CLI usage.
 # imports = [ /path/to/overlay/nixos.nix ];
 # -----------------

 # Now, you have access to the packages contained here.
 environment.systemPackages = with pkgs; [
   fnctlPkgs.foo.somePackageName
 ];
}
```

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
