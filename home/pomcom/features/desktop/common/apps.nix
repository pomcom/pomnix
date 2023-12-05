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
      mullvad-vpn

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
      vscode

      gnome.nautilus
      gparted
      gnome.gnome-disk-utility

      cryptomator
      
      nextcloud-client
      #cadence
      #alsa-scarlett-gui
      #
      freerdp


      
  ];
}
