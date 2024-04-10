{ inputs, pkgs, ... }: {

  
    imports = [

        ./global
        ./features/desktop/common/wayland-wm/alacritty.nix
        ./features/desktop/common/wezterm/wezterm.nix
        ./features/desktop/i3/i3-vm.nix
        ./features/desktop/common/font.nix
    ];

    home.packages = with pkgs; [

    ];
  }
