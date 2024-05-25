{ config, lib, pkgs, user, ... }:

{
  services.mullvad-vpn = {
    enable = true;
  };

  services.mullvad-vpn.package = pkgs.mullvad-vpn;


  # TODO Currently needed for bugfix
  services.resolved.enable = true;

}
