# NixOS Overlay containing the defined functions.
self: super: with super;

{ fnctlPkgs = with super; {

  gnvim = callPackage ./gui/gnvim/default.nix {};

  ext = {
    android    = callPackage ./ext/android/default.nix {};
    coreutils  = callPackage ./ext/coreutils/default.nix {};
    golang     = callPackage ./ext/golang/default.nix {};
    ruby       = callPackage ./ext/ruby/default.nix {};
    nodejs     = callPackage ./ext/nodejs/default.nix {};
    python     = callPackage ./ext/python/default.nix {};
    rust       = callPackage ./ext/rust/default.nix {};
    kubernetes = callPackage ./ext/kubernetes/default.nix {};
    nix        = callPackage ./ext/nix/default.nix {};
  };

  customized.vscode = {
    jakelogemann = callPackage ./customized/vscode/jakelogemann.nix {};
    christine    = callPackage ./customized/vscode/christine.nix {};
  };

  customized.neovim = {
    jakelogemann = callPackage ./customized/neovim/jakelogemann {};
  };

}; }
