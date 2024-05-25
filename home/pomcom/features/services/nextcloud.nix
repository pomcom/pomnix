{ config, lib, pkgs, user, ... }:
{
  services.nextcloud-client = {
    enable = true;
    startInBackground = true;
  };
}
