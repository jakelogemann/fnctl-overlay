{ stdenv, buildEnv, writeShellScriptBin, writeText, pkgs }:

buildEnv {
  name    = "coreutils-ext";

  meta = with stdenv.lib; {
    description = "extended coreutils package set.";
    homepage    = "https://gitlab.com/fnctl-nix/pkgs-overlay.git";
    license     = licenses.mit;
    maintainers = [ maintainers.jakelogemann ];
    platforms   = platforms.linux;
    priority    = -502;
  };

  pathsToLink      = ["/bin"];
  ignoreCollisions = true;
  paths = with pkgs; [

    binutils
    cacert    # A bundle of X.509 certificates of public Certificate Authorities (CA)
    coreutils # The basic file, shell and text manipulation utilities of the GNU operating system
    findutils # GNU Find Utilities, the basic directory searching utilities of the GNU operating system
    gawk      # GNU implementation of the Awk programming language
    gitAndTools.git
    gnugrep   # GNU implementation of the Unix grep command
    gnumake
    gnupatch
    gnupg
    gnused    # GNU sed, a batch stream editor
    gnutar    # GNU implementation of the `tar' archiver
    gzip      # GNU zip compression program
    hwinfo    # Hardware detection tool
    jq
    lshw      # Pretty, indented hardware info
    lsof      # A tool to list open files
    neovim
    neovim-remote
    openssl   # A cryptographic library that implements the SSL and TLS protocols
    pass      # Stores, retrieves, generates, and synchronizes passwords securely
    pciutils  # A collection of programs for inspecting and manipulating configuration of PCI devices
    pstree    # Shows processes
    readline  # Library for interactive line editing
    ripgrep   # Utility that combines the usability of The Silver Searcher with the speed of grep
    thefuck   # Magnificent app which corrects your previous console command
    time       # Tool that runs programs and summarizes the system resources they use
    tpm-tools # Trusted process module tools
    tree      # Command to produce a depth indented directory listing
    universal-ctags
    unzip     # An extraction utility for archives compressed in .zip format
    usbutils  # Tools for working with USB devices, such as lsusb
    which     # command to locate the executable file associated with the given command

  ];
}
