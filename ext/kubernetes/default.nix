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
  name    = "kubernetes-ext";

  meta = with stdenv.lib; {
    description = "common Kubernetes environment plus extra custom extensions";
    homepage    = "https://gitlab.com/fnctl-nix/pkgs-overlay.git";
    license     = licenses.mit;
    maintainers = [ maintainers.jakelogemann ];
    platforms   = platforms.linux;
    priority    = -502;
  };

  pathsToLink      = ["/bin"];
  ignoreCollisions = true;

  paths = with pkgs; [
    kubectl     # Kubernetes CLI
    minikube    # A tool that makes it easy to run Kubernetes locally
    skaffold    # Easy and Repeatable Kubernetes Development
    kubectl
    kubernetes-helm  # Kubernetes deployment tool.
    google-cloud-sdk
    buildah     # OCI `docker build` alternative (no root/daemon needed).
    skopeo      # OCI registry manipulation tool.
    runc        # Daemonless container runtime.
  ] ++ customScripts;

}
