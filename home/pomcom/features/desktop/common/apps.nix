
{ pkgs, ... }: {
  home.packages = with pkgs; [
      chromium
      gnome3.nautilus
      gitkraken
      okular
      element-desktop
      discord
      flameshot
      spotify
  ];
}
