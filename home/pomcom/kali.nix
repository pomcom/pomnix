{ inputs, pkgs, ... }: {

  {
    imports = [

      ./global
        ./features/desktop/common/font.nix
        ./features/desktop/common/wayland-wm/alacritty.nix
    ];



    home.packages = with pkgs; [

    ];
  }
