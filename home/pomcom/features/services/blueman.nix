{ config, lib, pkgs, user, ... }:
{
  services.blueman-applet = {
    enable = true;
  };

   home.packages = with pkgs; [
    blueman
    
  ];
}
