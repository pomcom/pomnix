{ config, lib, pkgs, user, ... }:
{
  services.syncthing= {
    enable = true;
  };
}
