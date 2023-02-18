{ inputs, pkgs, ... }: {
  imports = [
    ./global
    ./features/desktop/hyprland
  ];
}
