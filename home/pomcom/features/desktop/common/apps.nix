{ pkgs, ... }: {
  home.packages = with pkgs; [

      chromium

      gitkraken

      okular
      zathura
      pdftk
      pdfchain

      element-desktop
      discord
      
      spotify
      mullvad-vpn
      signal-desktop

      pulsar
      onedrive
      joplin-desktop
      
      texlive.combined.scheme-full
      texmaker

      vlc

      # sec audit
      lynis
      clamav
      
      postman

      gnome.nautilus
      gparted
      # gnome-disk-utlity
      
      
  ];
}
