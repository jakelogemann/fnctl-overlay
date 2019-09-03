{ writeShellScriptBin }:
writeShellScriptBin "nixos-repl.sh" ''
#!/usr/bin/env bash
set -euo pipefail

# Create a temporary directory and ensure its cleaned up later.
readonly tmp_dir=$(mktemp -d); trap "rm -rfv $tmp_dir" ERR EXIT
# Create the repl.nix file to load the nixos environment.
cat - >"$tmp_dir/repl.nix" <<-'EOF'
{ 
  nixos   ? (import <nixpkgs/nixos> {}),
  config  ? nixos.config,
  options ? nixos.options,
  pkgs    ? nixos.pkgs,
  lib     ? pkgs.lib,
  stdenv  ? pkgs.stdenv,
  ...
}: {
  # Inherit the evaluated NixOS module used to configure the system.
  inherit nixos;
  # Inherit standard NixOS parameters (used by most host-configurations).
  inherit options config lib pkgs stdenv;
}
EOF

set -o verbose; exec nix repl $* "$tmp_dir/repl.nix"
''
