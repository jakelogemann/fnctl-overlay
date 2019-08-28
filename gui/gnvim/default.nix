{ stdenv, buildEnv, writeShellScriptBin, writeText, rustPlatform, pkgconfig, openssl, gnome3, git}:
let
  version = "0.1.4";
  versionFix = writeText "gnvim-version-fix" ''
use std::env;
use std::fs::File;
use std::io::Write;
use std::path::Path;
use std::process::Command;

fn main() {
    let out_dir = env::var("OUT_DIR").unwrap();
    let dest_path = Path::new(&out_dir).join("gnvim_version.rs");
    let mut f = File::create(&dest_path).unwrap();
    f.write_all(
        format!("const VERSION: &str = \"{}\";", "${version}")
            .into_bytes()
            .as_slice(),
    )
    .unwrap();
}
'';

  gnvimPkg = rustPlatform.buildRustPackage rec {
    inherit version;
    name = "gnvim-${version}";
    cargoSha256 = "0y4yi4w3bdswnfw73n4yn68bx5kl3ikkp21yahgp3hnxx12abv6d";
    RUST_BACKTRACE = 1;

    src = builtins.fetchGit {
      url = "https://github.com/vhakulinen/gnvim.git";
      ref = version;
    };

    nativeBuildInputs = [
      git
      pkgconfig
      openssl
      gnome3.glib
      gnome3.webkitgtk
    ];

    postUnpack = ''
      cat ${versionFix} > ./source/build.rs
    '';

    installPhase = ''
      mkdir -p $out/bin $out/share/{applications,gnvim,icons}/
      cp ./target/release/gnvim $out/bin/gnvim-unwrapped
      cp -rv ./runtime $out/share/gnvim/runtime
      cp -rv ./desktop/*.png ./desktop/*.svg $out/share/icons/
      cp -rv ./desktop/*.desktop $out/share/applications/
    '';

    meta = with stdenv.lib; {
      description = "GUI NeoVim w/out Electron Bloat!";
      homepage = "https://github.com/vhakulinen/gnvim.git";
      license = licenses.mit;
      maintainers = [ maintainers.jakelogemann ];
      platforms = platforms.linux;
    };
  };

in buildEnv {
  name = "gnvim";
  pathsToLink = ["/share" "/bin"];
  ignoreCollisions = true;
  meta.priority = -500;
  paths = [

    (writeShellScriptBin "gnvim" ''
      #!/usr/bin/env bash
      export GNVIM_RUNTIME_PATH="$(gnvim-nixStorePath)/share/gnvim/runtime"
      exec \
        "$(gnvim-nixStorePath)/bin/gnvim-unwrapped" \
        --disable-ext-cmdline \
        --disable-ext-popupmenu \
        --disable-ext-tabline \
        --print-nvim-cmd -- \
        $*
    '')

    (writeShellScriptBin "gnvim-nixStorePath" ''
      #!/usr/bin/env bash
      realpath $(dirname $(dirname $(readlink $(which gnvim-unwrapped))))
    '')

    gnvimPkg
  ];

  passthru = {
    inherit gnvimPkg;
  };
}
