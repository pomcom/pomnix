{ config, lib, pkgs, user, ... }:

{
  services.udiskie = {
    enable = true;
    automount = true;
    notify = true;
    tray = "auto";
  };
}
