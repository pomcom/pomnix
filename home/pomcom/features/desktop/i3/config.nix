{ config, lib, pkgs, user, ... }:

{


  home.packages = with pkgs; [
    keepmenu
    i3status
  ];

  programs.rofi = {
    enable = true;
    theme = "purple";
  };

  

  xsession.windowManager.i3 = {
    enable = true;
  
    config = rec {
      modifier = "Mod4";
      terminal = "Alacritty";
      menu = "rofi -show run";

      gaps = {
        inner = 5;
        outer = 5;
        smartGaps = true;
        smartBorders = "on";
      };

      assigns = {
        "2" = [{ class = "alacritty"; }];
        "3" = [{ class = "Firefox"; }];
        "4" = [{ class = "Signal"; }];
        "5" = [{ class = "Thunderbird"; }];
      };

      bars = [ {
        mode = "dock";
        position = "top";
        statusCommand = "${pkgs.i3status}/bin/i3status";


        } ];

      startup =[
        # { command = "alacritty"; }
      ];


      keybindings = lib.mkOptionDefault (
         let
           mod = "${modifier}";
           left = "h";
           down = "j";
           up = "k";
           right = "l";
         in 
         {

          # "${mod}+enter" = "exec ${config.home.profileDirectory}/bin/alacritty";
          # "${mod}+enter" = "exec ${pkgs.alacritty}/bin/alacritty"
           # "${mod}+o" = "exec ${config.home.profileDirectory}/bin/krunner";

          "${mod}+q" = "kill";

           # "${mod}+space" = "exec ${pkgs.rofi}/bin/rofi -show run";
           # "${mod}+space" = "exec env PATH=\"${systemPath}\" ${pkgs.rofi}/bin/rofi -show run";

          "${mod}+m" = "exec ${pkgs.rofi}/bin/rofi -show";
          "${mod}+${left}" = "focus left";
          "${mod}+${down}" = "focus down";
          "${mod}+${up}" = "focus up";
          "${mod}+${right}" = "focus right";

          "${mod}+Left" = "focus left";
          "${mod}+Down" = "focus down";
          "${mod}+Up" = "focus up";
          "${mod}+Right" = "focus right";

          "${mod}+Shift+${left}" = "move left";
          "${mod}+Shift+${down}" = "move down";
          "${mod}+Shift+${up}" = "move up";
          "${mod}+Shift+${right}" = "move right";

          "${mod}+Shift+Left" = "move left";
          "${mod}+Shift+Down" = "move down";
          "${mod}+Shift+Up" = "move up";
          "${mod}+Shift+Right" = "move right";

          "${mod}+Shift+space" = "floating toggle";

          "${mod}+1" = "workspace number 1";
          "${mod}+2" = "workspace number 2";
          "${mod}+3" = "workspace number 3";
          "${mod}+4" = "workspace number 4";
          "${mod}+5" = "workspace number 5";
          "${mod}+6" = "workspace number 6";
          "${mod}+7" = "workspace number 7";
          "${mod}+8" = "workspace number 8";
          "${mod}+9" = "workspace number 9";
          "${mod}+0" = "workspace number 10";

          "${mod}+Shift+1" = "move container to workspace number 1";
          "${mod}+Shift+2" = "move container to workspace number 2";
          "${mod}+Shift+3" = "move container to workspace number 3";
          "${mod}+Shift+4" = "move container to workspace number 4";
          "${mod}+Shift+5" = "move container to workspace number 5";
          "${mod}+Shift+6" = "move container to workspace number 6";
          "${mod}+Shift+7" = "move container to workspace number 7";
          "${mod}+Shift+8" = "move container to workspace number 8";
          "${mod}+Shift+9" = "move container to workspace number 9";
          "${mod}+Shift+0" = "move container to workspace number 10";

          "${mod}+p" =
            "exec ${pkgs.slurp}/bin/slurp | ${pkgs.grim}/bin/grim -g- screenshot-$(date +%Y%m%d-%H%M%S).png";

          # "${mod}+h" = "split ;
          "${mod}+v" = "split v";
          "${mod}+f" = "fullscreen toggle";
          "${mod}+comma" = "layout stacking";
          "${mod}+period" = "layout tabbed";
          "${mod}+slash" = "layout toggle split";
          "${mod}+a" = "focus parent";
          "${mod}+s" = "focus child";

          "${mod}+r" = "mode resize";

          # "${mod}+Control+q" = ''exec ${pkgs.swaylock}/bin/swaylock -f -i ~/Wallpapers/reunion-lake.jpg'';
          # "${mod}+m" = "exec ${pkgs.mako}/bin/makoctl dismiss";
          "${mod}+shift+m" = "exec ${pkgs.mako}/bin/makoctl dismiss -a";

          "${mod}+apostrophe" = "move workspace to output right";

          "${mod}+minus" = "scratchpad show";
          "${mod}+underscore" = "move container to scratchpad";


          "${modifier}+control+j" = "resize shrink height 20 px";
          "${modifier}+control+k" = "resize grow height 20 px";

          "${modifier}+control+h" = "workspace prev";
          "${modifier}+control+l" = "workspace next";

          # "${modifier}+r" = "mode resize";

          "XF86AudioLowerVolume" = "exec ${pkgs.pamixer}/bin/pamixer -d 10";
          "XF86AudioLowerVolume+Shift" = "exec ${pkgs.pamixer}/bin/pamixer -d 10 --allow-boost";
          "XF86AudioRaiseVolume" = "exec ${pkgs.pamixer}/bin/pamixer -i 10";
          "XF86AudioRaiseVolume+Shift" = "exec ${pkgs.pamixer}/bin/pamixer -i 10 --allow-boost";
          "XF86AudioMute" = "exec ${pkgs.pamixer}/bin/pamixer -t";

          "XF86MonBrightnessDown" = "exec ${pkgs.light}/bin/light -U 10";
          "XF86MonBrightnessUp" = "exec ${pkgs.light}/bin/light -A 10";

          "XF86AudioPlay" = "exec ${pkgs.playerctl}/bin/playerctl play-pause";
          "XF86AudioNext" = "exec ${pkgs.playerctl}/bin/playerctl next";
          "XF86AudioPrev" = "exec ${pkgs.playerctl}/bin/playerctl previous";
        });
    };
    extraConfig = 
      ''
      for_window [title="Desktop — Plasma"] kill; floating enable; border none
      for_window [class="krunner"] floating enable, border none

      ''
      ;

      
  };

}
