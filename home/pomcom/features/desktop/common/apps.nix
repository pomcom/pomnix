{ pkgs, ... }: {
  home.packages = with pkgs; [

    chromium
    brave
    vivaldi
    google-chrome

    gitkraken

    okular
    zathura
    pdfchain

    spotify
    onedrive

    texlive.combined.scheme-full
    texmaker

    vlc

    # citrix_workspace

    gnome.nautilus
    gparted
    gnome.gnome-disk-utility

    cryptomator

  ];
}
