{ config, lib, pkgs, ... }:


{
#todo cleanup
  users.users.pomcom.packages = with pkgs; [

    ferdium
    element-desktop	
    teams
    discord
    
    okular


    qutebrowser
    jdk17
    libreoffice
    plantuml-c4
    
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

    wireshark
    termshark
   
    pciutils
    nmap
    amass
    testssl
    gnupg
    glances

    alacritty
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
