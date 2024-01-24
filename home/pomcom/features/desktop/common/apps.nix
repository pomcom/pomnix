{ pkgs, ... }: {
  home.packages = with pkgs; [

    chromium
    brave
    vivaldi
    google-chrome

    gitkraken

    okular
    zathura
    pdftk
    pdfchain

    spotify
    onedrive
    joplin-desktop

    texlive.combined.scheme-full
    texmaker

    vlc
    lynis

    citrix_workspace

    gnome.nautilus
    gparted
    gnome.gnome-disk-utility

    cryptomator
    nextcloud-client

  ];
}
