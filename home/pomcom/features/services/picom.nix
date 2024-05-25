{ config, lib, pkgs, user, ... }:
{
  services.picom = {
    enable = true;
    vSync = true;
#backend = "glx";
    # activeOpacity = 0.95; 
    # inactiveOpacity = 0.7;
    settings = {
"corner-radius" = 5;
"round-borders" = 1;
      "shadow" = true;
# "fading" = true;
"fade-in-step" = 0.3;

    };

  };
}
