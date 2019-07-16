{
  stdenv,
  buildEnv,
  writeShellScriptBin,
  writeText,
  rustPlatform,
  pkgconfig,
  rustup,
  ripgrep,
  universal-ctags,
  openssl,
  git,
}:

buildEnv {
  name    = "rust-ext";

  meta = with stdenv.lib; {
    description = "custom rust extensions";
    homepage    = "https://gitlab.com/fnctl/nix/pkgs/overlay.git";
    license     = licenses.mit;
    maintainers = [ maintainers.jakelogemann ];
    platforms   = platforms.linux;
    priority    = -502;
  };

  pathsToLink      = ["/bin"];
  ignoreCollisions = true;

  paths = [
    pkgconfig
    openssl
    rustup
    git
    ripgrep
    universal-ctags

    (writeShellScriptBin "rustx-upgrade-tools" ''
      #!/usr/bin/env bash
      set -xeuo pipefail
      cargo install --list \
        | grep -ve "^ " \
        | awk '{print $1}' \
        | xargs -n1 -I'{}' \
          nix-shell ~/rust/shell.nix --run "cargo +nightly install --force '{}'"
    '')

  ];

}
