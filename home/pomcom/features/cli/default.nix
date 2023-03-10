{ pkgs, ... }: {
  imports = [
    ./bat.nix
    ./git.nix
    ./zsh.nix
    ./tmux.nix
  ];

  home.packages = with pkgs; [
    exa
    fd
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
    p7zip
    unzip
    killall
    cargo
    neofetch
  ];
}
