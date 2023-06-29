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

      xfce.thunar-volman
      xfce.thunar-archive-plugin
      xfce.thunar-media-tags-plugin

      # sec audit
      lynis
      clamav

  
      #nextcloud-client
  ];
}
