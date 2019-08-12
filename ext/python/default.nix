{ stdenv, buildEnv, writeShellScriptBin, writeText, pkgs }:

let
  /* Embedded Python Environment */
  pythonEnvironment = (pkgs.python3Full.withPackages (p: with p; [
    ipython         # IPython: Productive Interactive Computing
    pep8
    pip             # The PyPA recommended tool for installing Python packages
    pip-tools
    pyflakes
    virtualenv
    virtualenvwrapper
    pygments        # A generic syntax highlighter
    pylint
    pytest
    pytest-flake8
    python-language-server
    requests        # An Apache2 licensed HTTP library, written in Python, for human beings
    setuptools
    yapf
  ]));

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
  name    = "python-ext";

  meta = with stdenv.lib; {
    description = "common Python environment plus extra custom extensions";
    homepage    = "https://gitlab.com/fnctl-nix/pkgs-overlay.git";
    license     = licenses.mit;
    maintainers = [ maintainers.jakelogemann ];
    platforms   = platforms.linux;
    priority    = -502;
  };
  pathsToLink      = ["/bin"];
  ignoreCollisions = true;
  paths = [pythonEnvironment] ++ customScripts;
}
