{ config, lib, pkgs, user, ... }:
{
  services.nextcloud-client = {
    enable = false;
    startInBackground = true;
  };
}
