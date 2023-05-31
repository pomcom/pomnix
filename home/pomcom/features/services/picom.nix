{ config, lib, pkgs, user, ... }:
{
  services.picom = {
    enable = true;
    vSync = true;
    backend = "glx";
    /* activeOpacity = 0.7; */
    inactiveOpacity = 0.9;
  };
}
