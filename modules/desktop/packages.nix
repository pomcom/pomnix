{ config, lib, pkgs, ... }:


{
#todo cleanup
  packages = with pkgs; [

    opensnitch
    opensnitch-ui
    ferdium
    element-desktop	
    teams
    discord
    
    okular

    ngrok
    # grafana

    qutebrowser
    jdk17
    libreoffice
    mitmproxy
    plantuml-c4
    barrier
    
    sqlmap
    hakrawler
    xsser
    whatweb
    kiterunner
    dalfox

    gitkraken
    blueman 
    
    pavucontrol
    texlive.combined.scheme-full
    texmaker
    tikzit    
    
    zotero
  
    drawio
    flameshot
    lazygit

    wireshark
    termshark
   
    pciutils
    nmap
    amass
    testssl
    jq
    gnupg
    glances

    graphviz
    pprof
    
    gnumake 

    keepassxc
    obsidian
    joplin-desktop
    spotify
    zathura    
    arandr
    nitrogen
    wmctrl
    i3lock-fancy
    volumeicon
    lxappearance
    qt5ct
    xss-lock
    xorg.xmodmap
    xclip

    firefox-devedition-bin
    chromium
    vscodium

    mullvad-vpn

    thunderbird
    nextcloud-client
    gnome3.nautilus
    gnome3.file-roller
    gnome.gnome-tweaks
    gnome.pomodoro

    acpi

    openssl
    python3
    # python3Packages.pip
    gcc
    openconnect 
    inotify-tools
 
  ];

}
