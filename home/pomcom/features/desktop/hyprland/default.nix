{ inputs, lib, config, pkgs, ... }: {
  imports = [
    ../common
    ../common/wayland-wm
    inputs.hyprland.homeManagerModules.default
  ];

  programs = {
    zsh.loginExtra = ''
      if [ "$(tty)" = "/dev/tty1" ]; then
        exec Hyprland &> /dev/null
      fi
    '';
    zsh.profileExtra = ''
      if [ "$(tty)" = "/dev/tty1" ]; then
        exec Hyprland &> /dev/null
      fi
    '';
  };

  home.packages = with pkgs; [
    inputs.hyprwm-contrib.packages.${system}.grimblast
    swaybg
    swayidle
    hyprpaper
  ];

  programs.waybar.package = pkgs.waybar.overrideAttrs (oa: {
    mesonFlags = (oa.mesonFlags or  [ ]) ++ [ "-Dexperimental=true" ];
  });

  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = (import ./config.nix);
    package = inputs.hyprland.packages.${pkgs.system}.default;
    # extraConfig =
    #   (import ./monitors.nix {
    #     inherit lib;
    #     inherit (config) monitors;
    #   }) +
    #   (import ./config.nix {
    #     inherit (config) colorscheme wallpaper;
    #   });
  };

  xdg.configFile = {
    wallpapers = {
      source = ../../../resources/Wallpapers;
      recursive = true;
    };
  };

  xdg.configFile = {
    "hypr/hyprpaper.conf" = {
      text = ''
        preload = ~/.config/wallpapers/nasa-3440x1440.jpg
        # wallpaper = eDP-1,~/.config/wallpapers/nasa-3440x1440.jpg
        wallpaper = HDMI-A-1,~/.config/wallpapers/nasa-3440x1440.jpg
      '';
    };
  };
}
