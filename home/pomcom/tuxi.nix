{ inputs, pkgs, ... }: {
  imports = [
    ./global
    ./features/services/udiskie.nix
    ./features/desktop/hyprland
    ./features/services/syncthing.nix
  ];
}
