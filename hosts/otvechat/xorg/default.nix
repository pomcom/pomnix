{ pkgs, ... }:
{
  services.xserver = {
    enable = true;
     # videoDrivers = [ "displaylink" "modsetting"];
  };
}
