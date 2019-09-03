{ writeShellScriptBin }:
writeShellScriptBin "nix-shell-rust" ''
#!/usr/bin/env bash
set -euo pipefail

# Create a temporary directory and ensure its cleaned up later.
readonly tmp_dir=$(mktemp -d); trap "rm -rfv $tmp_dir" ERR EXIT

# Create the repl.nix file to load the nixos environment.
cat - >"$tmp_dir/shell.nix" <<-'EOF'
{ pkgs ? (import <nixpkgs> {}) }:
pkgs.mkShell {
  name        = "nix-shell-rust";
  buildInputs = (with pkgs; [
    alsaLib
    binutils
    clangStdenv
    cmake
    mkpasswd
    graphviz
    dbus
    gcc
    gegl
    gitAndTools.git
    gitAndTools.lab
    glib.dev
    ncurses
    gnome3.clutter-gst
    gnome3.glib
    gnome3.webkitgtk
    gnumake
    llvmPackages_latest.clang
    llvmPackages_latest.clang-manpages
    llvmPackages_latest.libclang
    llvmPackages_latest.llvm
    llvmPackages_latest.lldb
    llvmPackages_latest.llvm-manpages
    libffi.dev
    libudev
    nodejs
    openssl_1_0_2.dev
    pkgconfig
    rustup
    sqlite
    tmux
    tmuxp
  ]);
}
EOF

exec nix-shell "$tmp_dir/shell.nix" $@
''
