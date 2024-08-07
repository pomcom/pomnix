{ pkgs, ... }: {
  imports = [
    ./bat.nix
    ./git.nix
    ./zsh.nix
    ./tmux
    ./pentest.nix
    ./compression.nix
  ];

  home.packages = with pkgs; [


    bottles

    ranger
    mc
    fd
    lsof
    httpie
    jq
    lazygit
    mitmproxy
    ncdu
    ngrok
    ripgrep
    htop
    btop
    gnumake
    openvpn
    wget
    gcc
    killall
    neofetch
    file
    tree
    lshw

    gnupg

    openssl
    sops

    traceroute
    pciutils

    restic
    sshfs

    bandwhich
    ctop
    gping
    speedtest-cli
    ddgr
    navi
    procs

    usbutils
    expect
    iftop

    exiftool
    tldr
    hyperfine
    jq
    ripgrep
    sd
    tre

    pdftk
    tree
    steam-run

  ];

}
