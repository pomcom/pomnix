{ config, lib, pkgs, ... }:

let
mod = "Mod4";
in
{


 users.users.pomcom.packages.xsession.windowManager.i3 = {
    enable = true;
    package = pkgs.i3-gaps;
    config = rec {
      modifier = mod;

      
      startup = [
      {command = "--no-startup-id nm-applet";}
      {command = "--no-startup-id xmodmap /home/pomcom/pomnix/desktop/.Xmodmap";}
      {command = "--no-startup-id volumeicon ";}
      {command = "--no-startup-id blueman-applet";}
      {command = "--no-startup-id nitrogen --restore";}
      {command = "--no-startup-id xss-lock --transfer-sleep-lock -- i3lock-fancy -f Hack-Regular-Nerd-Font-Complete -t pomcom";}
      ];

      fonts = [ "DejaVu Sans Mono, FontAwesome 6" ];

      keybindings = lib.mkOptionDefault {

        "${mod}+Return" = "exec alacritty";
        "${mod}+space" = "exec rofi -show run";
        "${mod}+m" = "exec rofi -show";
        "${mod}+u" = "exec rofi -show ssh";
        "${mod}+x" = "exec i3lock-fancy -f Hack-Regular-Nerd-Font-Complete -t pomcom";

        "${mod}+f" = "fullscreen toggle";
        "${mod}+r" = "mode resize";

        "${mod}+s" = "layout stacking";
        "${mod}+t" = "layout tabbed";
        "${mod}+e" = "layout toggle split";

        "${mod}+q" = "kill";

        "${mod}+h" = "focus left";
        "${mod}+j" = "focus down";
        "${mod}+k" = "focus up";
        "${mod}+l" = "focus right";

        "${mod}+Shift+h" = "move left";
        "${mod}+Shift+j" = "move down";
        "${mod}+Shift+k" = "move up";
        "${mod}+Shift+l" = "move right";

        "${mod}+1" = "workspace 1";
        "${mod}+2" = "workspace 2";
        "${mod}+3" = "workspace 3";
        "${mod}+4" = "workspace 4";
        "${mod}+5" = "workspace 5";
        "${mod}+6" = "workspace 6";
        "${mod}+7" = "workspace 7";
        "${mod}+8" = "workspace 8";
        "${mod}+9" = "workspace 9";
        "${mod}+0" = "workspace 10";

        "${mod}+control+j" = "resize shrink height 20 px";
        "${mod}+control+k" = "resize grow height 20 px";

        "${mod}+control+h" = "workspace prev";
        "${mod}+control+l" = "workspace next";

        "${mod}+Shift+1" = "move container to workspace 1";
        "${mod}+Shift+2" = "move container to workspace 2";
        "${mod}+Shift+3" = "move container to workspace 3";
        "${mod}+Shift+4" = "move container to workspace 4";
        "${mod}+Shift+5" = "move container to workspace 5";
        "${mod}+Shift+6" = "move container to workspace 6";
        "${mod}+Shift+7" = "move container to workspace 7";
        "${mod}+Shift+8" = "move container to workspace 8";
        "${mod}+Shift+9" = "move container to workspace 9";
        "${mod}+Shift+0" = "move container to workspace 10";
      };


      bars = [
      {
        position = "bottom";


      }
      

      ];
     
    };

  };

}


