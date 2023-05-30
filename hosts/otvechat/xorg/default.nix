{ pkgs, ... }:
{
  services.xserver = {
    enable = true;
    videoDrivers = ["modsetting"];
  };
}
