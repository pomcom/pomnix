{ inputs, pkgs, ... }: {

  imports = [

    ./global

    ./features/desktop/common/default.nix

    ./features/dev/java.nix

    ./features/desktop/common/wayland-wm/alacritty.nix

    ./features/services/nextcloud.nix
    ./features/services/udiskie.nix
    ./features/services/syncthing.nix
    ./features/services/blueman.nix
    ./features/services/picom.nix

    ./features/desktop/i3/tuxi-config.nix
  ];

  home.packages = with pkgs; [
    libreoffice-fresh
    ferdium
  ];
}
