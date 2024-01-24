{ config, lib, pkgs, user, ... }:
{
  services.picom = {
    enable = true;
    vSync = true;
    #backend = "glx";
    /* activeOpacity = 0.7; */
    # inactiveOpacity = 0.9;
    settings = {
      # "corner-radius" = 1;
      # "round-borders" = 1;
      "shadow" = true;
      # "fading" = true;
      # "fade-in-step" = 0.3;

    };

  };
}
