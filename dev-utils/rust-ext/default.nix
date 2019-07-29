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

    (writeShellScriptBin "rustx-install--cargo-tools" ''
      #!/usr/bin/env bash
      install_crate(){ cargo +nightly install --force $* ;}
      set -xeuo pipefail

      install_crate cargo-audit
      install_crate cargo-edit
      install_crate cargo-expand
      install_crate cargo-make
      install_crate cargo-release
      install_crate cargo-vendor
      install_crate cargo-watch

      exit 0
    '')

    (writeShellScriptBin "rustx-install--common-tools" ''
      #!/usr/bin/env bash
      install_crate(){ cargo +nightly install --force $* ;}
      set -xeuo pipefail

      install_crate lsd
      install_crate mdbook
      install_crate systemfd
      install_crate microserver

      exit 0
    '')

    (writeShellScriptBin "rustx-install--dev-tools" ''
      #!/usr/bin/env bash
      install_crate(){ cargo +nightly install --force $* ;}
      set -xeuo pipefail

      rustx-install--cargo-tools

      install_crate rusty-tags
      install_crate wasm-pack

      exit 0
    '')

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

}
