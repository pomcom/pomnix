{ pkgs, ... }: {
  imports = [
    ./bat.nix
    ./git.nix
    ./zsh.nix
    ./tmux.nix
    ./pentest.nix
    ./compression.nix
  ];

  home.packages = with pkgs; [

    mc
    eza
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

    gnupg

    openssl
    sops

    traceroute 
    pciutils

    restic
    sshfs

    mitmproxy
    
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

  ];


 

}
