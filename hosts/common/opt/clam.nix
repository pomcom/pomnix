{ config, lib, pkgs, user, ... }:
{
  services.clamav = {
    daemon.enable = false;
    updater.enable = false;
  };
}
