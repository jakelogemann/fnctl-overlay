{ stdenv, buildEnv, writeShellScriptBin, gnumake, pkgconfig, openssl, gnome3, rustup }:
let
  gnvimPkg = stdenv.mkDerivation rec {
    name = "gnvim-pinned-${version}";
    version = "master";

    src = builtins.fetchGit {
      url = "https://github.com/vhakulinen/gnvim.git";
      rev = "4b248cda4a6858544c6dbe9a4ad79796a7008247";
    };

    buildInputs = [
      gnumake
      pkgconfig
      openssl
      gnome3.glib
      gnome3.webkitgtk
      rustup
    ];


    buildPhase = ''
      make
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
      exec "$(gnvim-nixStorePath)/bin/gnvim-unwrapped" $*
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
