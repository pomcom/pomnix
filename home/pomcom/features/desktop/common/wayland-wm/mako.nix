{ config, ... }:
{
  programs.mako = {
    enable = true;
    iconPath = "${config.gtk.iconTheme.package}/share/icons/Papirus-Dark";
    width = 400;
    height = 150;
    borderSize = 2;
    defaultTimeout = 12000;
    # backgroundColor = "#${colors.base00}dd";
    # borderColor = "#${colors.base03}dd";
    # textColor = "#${colors.base05}dd";
  };
}
