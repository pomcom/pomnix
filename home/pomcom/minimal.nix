{ inputs, pkgs, ... }: {

    
  imports = [

      ./global
      ./features/desktop/common/font.nix
      ./features/desktop/common/wayland-wm/alacritty.nix

  home = {
    username = "pomcom";
    homeDirectory = /home/pomcom;


    };

  home.packages = with pkgs; [

  ];
         
