{ stdenv, buildEnv, writeShellScriptBin, writeText, pkgs }:

let
  customScripts = [
    /*(writeShellScriptBin "ext-android-upgrade-tools" ''
      #!/usr/bin/env bash
      set -xeuo pipefail
      cargo install --list \
        | grep -ve "^ " \
        | awk '{print $1}' \
        | xargs -n1 -I'{}' \
          cargo +nightly install --force '{}'
    '')*/
  ];


in buildEnv {
  name    = "android-ext";

  meta = with stdenv.lib; {
    description = "common Android environment plus extra custom extensions";
    homepage    = "https://gitlab.com/fnctl-nix/pkgs-overlay.git";
    license     = licenses.mit;
    maintainers = [ maintainers.jakelogemann ];
    platforms   = platforms.linux;
    priority    = -502;
  };

  pathsToLink      = ["/bin"];
  ignoreCollisions = true;

  paths = with pkgs; [
    android-udev-rules
    android-studio
  ] ++ customScripts;

}
