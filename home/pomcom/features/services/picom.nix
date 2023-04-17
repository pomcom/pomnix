{ config, lib, pkgs, user, ... }:
{
  services.picom = {
    enable = true;
    vSync = true;
    backend = "glx";
  };
}
