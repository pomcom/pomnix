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

      onedrive
      joplin-desktop
      
      texlive.combined.scheme-full
      texmaker

      vlc
      # sec audit
      lynis
      
      
      # vscode
      # ltex-ls
      # vscodium

      gnome.nautilus
      gparted
      gnome.gnome-disk-utility

      cryptomator
      
      nextcloud-client


      
  ];
}
