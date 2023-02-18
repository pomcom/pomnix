{ config, lib, pkgs,  ... }:



{

  packages = with pkgs; [
    rofi
     
  ];

  programs.rofi = {
    enable = true;
    terminal = "alacritty"; 
    theme = ./Adapta-Nokto.rasi;
    

  };

    }



