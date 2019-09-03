{
  stdenv,
  buildEnv,
  writeShellScriptBin,
  writeText,
  nix-du,
  git,
}:

buildEnv {
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

    (import ./nixos-repl.nix { inherit writeShellScriptBin; })
  ];
}
