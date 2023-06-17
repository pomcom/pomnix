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

    exa
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
    #openssl_1_1
    sops
    
    traceroute 
    pciutils

    restic


  ];


 

}
