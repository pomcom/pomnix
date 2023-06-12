{ pkgs, ... }: {
  home.packages = with pkgs; [

      chromium
      #gnome3.nautilus

      gitkraken

      okular
      zathura

      element-desktop
      discord
      
      spotify
      mullvad-vpn
      signal-desktop

      atom

      # polkit_gnome
      # move 
      texlive.combined.scheme-full
      texmaker
      #networkmanagerapplet
      vlc
      
      #nextcloud-client
  ];
}
