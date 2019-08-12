{ stdenv, buildEnv, writeShellScriptBin, writeText, pkgs }:

let
  customScripts = [
    /*(writeShellScriptBin "ext-kubernetes-upgrade-tools" ''
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
  name    = "golang-ext";

  meta = with stdenv.lib; {
    description = "common Go development environment plus extra custom extensions";
    homepage    = "https://gitlab.com/fnctl-nix/pkgs-overlay.git";
    license     = licenses.mit;
    maintainers = [ maintainers.jakelogemann ];
    platforms   = platforms.linux;
    priority    = -502;
  };

  pathsToLink      = ["/bin"];
  ignoreCollisions = true;

  paths = with pkgs; [
    go       # The Go programming language
    gocode   # An autocompletion daemon for the Go programming language
    dep      # Go dependency management tool
    dep2nix  # Convert `Gopkg.lock` files from golang dep into `deps.nix`
    go-tools # A collection of tools and libraries for working with Go code, including linters and static analysis
    gopkgs   # Tool to get list available Go packages
    gotests  # Generate Go tests from source code
    gosec    # Golang security checker
  ] ++ customScripts;

}
