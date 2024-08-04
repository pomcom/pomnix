{ pkgs, ... }: {
  home.packages = with pkgs; [

    chromium
    brave
    vivaldi
    google-chrome

    bambu-studio
    gitkraken

    okular
    zathura
    pdfchain

    spotify

    texlive.combined.scheme-full
    texmaker

    vlc

    # citrix_workspace

    nautilus
    gparted
    gnome-disk-utility

    cryptomator

    zed-editor

  ];
}
