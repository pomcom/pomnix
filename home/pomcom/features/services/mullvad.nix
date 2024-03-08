{ config, lib, pkgs, user, ... }:

{
  services.mullvad-vpn = {
    enable = true;
  };

  home.packages = with pkgs; [
  ];
}
