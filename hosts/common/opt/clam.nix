{ config, lib, pkgs, user, ... }:
{
  services.clamav = {
    daemon.enable = true;
    updater.enable = true;
  };
}
