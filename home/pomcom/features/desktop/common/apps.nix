
{ pkgs, ... }: {
  home.packages = with pkgs; [
      chromium
      gnome3.nautilus
      gitkraken
      okular
      element-desktop
      discord
      spotify
      mullvad-vpn
      signal-desktop

      polkit_gnome
      # move 
      texlive.combined.scheme-full
      texmaker
      networkmanagerapplet
      vlc
  ];
}
