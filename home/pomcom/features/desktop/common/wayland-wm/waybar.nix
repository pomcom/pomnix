{ outputs, config, lib, pkgs, ... }:

let

terminal = "${pkgs.alacritty}/bin/alacritty";
pavucontrol = "${pkgs.pavucontrol}/bin/pavucontrol";
in
{
  programs.waybar = {
    enable = true;
    settings = {


      primary = {
        mode = "dock";
        layer = "top";
        height = 14;
        margin = "6";
        position = "top";

        modules-left = [

        ];

        modules-center = [
        "cpu"
        "keyboard-state"
        "memory"
        "pulseaudio"
        "clock"

        ];

        modules-right = [
        "battery"
        "tray"
        "network"


        ];

        };

      };

       

   
 
  };
}
