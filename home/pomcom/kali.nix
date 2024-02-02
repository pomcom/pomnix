{ inputs, pkgs, ... }: {

  
    imports = [

        ./global
        ./features/desktop/common/wayland-wm/alacritty.nix
        ./features/desktop/i3/i3.nix
    ];



    home.packages = with pkgs; [

    ];
  }
