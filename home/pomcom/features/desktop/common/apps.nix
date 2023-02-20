
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
      flameshot
  ];
}
