{
  stdenv,
  buildEnv,
  writeShellScriptBin,
  writeText,
  nix-du,
  git,
}:

let
  customScripts = [
    (writeShellScriptBin "rustx-upgrade-tools" ''
      #!/usr/bin/env bash
      set -xeuo pipefail
      cargo install --list \
        | grep -ve "^ " \
        | awk '{print $1}' \
        | xargs -n1 -I'{}' \
          cargo +nightly install --force '{}'
    '')
  ];


in buildEnv {
  name    = "nix-ext";

  meta = with stdenv.lib; {
    description = "common Nix/NixOS environment plus extra custom extensions";
    homepage    = "https://gitlab.com/fnctl-nix/pkgs-overlay.git";
    license     = licenses.mit;
    maintainers = [ maintainers.jakelogemann ];
    platforms   = platforms.linux;
    priority    = -502;
  };

  pathsToLink      = ["/bin"];
  ignoreCollisions = true;

  paths = [
    nix-du    # A tool to determine which gc-roots take space in your nix store


  ] ++ customScripts;

}
