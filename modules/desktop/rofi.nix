{ config, lib, pkgs,  ... }:



{


 users.users.pomcom.packages.programs.rofi = {
    enable = true;
    terminal = "alacritty"; 
    theme = ./Adapta-Nokto.rasi;
    

  };

    }



