{ config, lib, pkgs, user, ... }:

{
  home.packages = with pkgs; [
    keepmenu
    autotiling
    rofi-power-menu
    haskellPackages.greenclip
    xorg.xmodmap
    i3status-rust
  ];

   programs.rofi = {
    enable = true;
    theme = "minimal.rasi";
    terminal = "kitty";
  };

  xsession.windowManager.i3 = {
    enable = true;

    config = rec {
      modifier = "Mod4";
      terminal = "kitty";
      workspaceAutoBackAndForth = true;

      gaps = {
        inner = 5;
        outer = 5;
        smartGaps = true;
        smartBorders = "on";
      };

      # applications on specific workspaces
      # reminder: xprop for class names
      #'class' matches the 'WM_CLASS': xprop | grep WM_CLASS
      ## 'title' matches the 'WM_NAME': xprop | grep WM_NAME
      assigns = {
        # "1" = [{ class = "Alacritty"; }];
        "2" = [{ class = "firefox-aurora"; }];
      };

      floating.criteria = [

      ];

      startup = [
        { command = "greenclip daemon >/dev/null"; }
        { command = "${pkgs.autotiling}/bin/autotiling"; }
        { command = "${pkgs.volumeicon}/bin/volumeicon"; }
        { command = "$/usr/bin/vmware-user"; }
        { command = "$/usr/bin/nm-applet"; }
      ];

      keybindings = lib.mkOptionDefault (
        let
          mod = "${modifier}";

          scriptpath = "/home/pomcom/tools/scripts-public/rofi-script";

          ws1 = "1";
          ws2 = "2";
          ws3 = "3";
          ws4 = "4";
          ws5 = "5";
          ws6 = "6";
          ws7 = "7";
          ws8 = "8";
          ws9 = "9";
          ws10 = "10";

          left = "h";
          down = "j";
          up = "k";
          right = "l";

        in
        {
          "${mod}+q" = "kill";

          "${mod}+m" = "exec ${pkgs.rofi}/bin/rofi -show";
          "${mod}+space" = "exec ${pkgs.rofi}/bin/rofi -show run";
          "${mod}+b" = "exec ${pkgs.rofi}/bin/rofi -modi 'clipboard:greenclip print' -show clipboard -run-command '{cmd}'";
          "${mod}+u" = "exec ${pkgs.rofi}/bin/rofi -show ssh";
          "${mod}+Shift+x" = "exec ${pkgs.rofi}/bin/rofi -show p -modi p:'rofi-power-menu'";
          "${mod}+x" = "exec ${pkgs.i3lock-fancy}/bin/i3lock-fancy";
          "${mod}+p" = "exec ${pkgs.flameshot}/bin/flameshot gui";
          "${mod}+t" = "exec /home/pomcom/tools/scripts-public/rofi-script/tmux_session.sh";


          "${mod}+g" = "exec ${scriptpath}/rofi_script_runner.sh";


          "${mod}+Tab" = "workspace back_and_forth";

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

          "${mod}+1" = "workspace number ${ws1}";
          "${mod}+2" = "workspace number ${ws2}";
          "${mod}+3" = "workspace number ${ws3}";
          "${mod}+4" = "workspace number ${ws4}";
          "${mod}+5" = "workspace number ${ws5}";
          "${mod}+6" = "workspace number ${ws6}";
          "${mod}+7" = "workspace number ${ws7}";
          "${mod}+8" = "workspace number ${ws8}";
          "${mod}+9" = "workspace number ${ws9}";
          "${mod}+0" = "workspace number ${ws10}";

          "${mod}+Shift+1" = "move container to workspace number ${ws1}";
          "${mod}+Shift+2" = "move container to workspace number ${ws2}";
          "${mod}+Shift+3" = "move container to workspace number ${ws3}";
          "${mod}+Shift+4" = "move container to workspace number ${ws4}";
          "${mod}+Shift+5" = "move container to workspace number ${ws5}";
          "${mod}+Shift+6" = "move container to workspace number ${ws6}";
          "${mod}+Shift+7" = "move container to workspace number ${ws7}";
          "${mod}+Shift+8" = "move container to workspace number ${ws8}";
          "${mod}+Shift+9" = "move container to workspace number ${ws9}";
          "${mod}+Shift+0" = "move container to workspace number ${ws10}";


          "${mod}+f" = "fullscreen toggle";
          "${mod}+comma" = "layout stacking";
          "${mod}+period" = "layout tabbed";
          "${mod}+slash" = "layout toggle split";
          "${mod}+a" = "focus parent";
          "${mod}+s" = "focus child";

          "${mod}+r" = "mode resize";

          "${mod}+apostrophe" = "move workspace to output right";

          "${mod}+control+j" = "resize shrink height 20 px";
          "${mod}+control+k" = "resize grow height 20 px";

          "${mod}+control+h" = "workspace prev";
          "${mod}+control+l" = "workspace next";

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
        }
      );
    };
    extraConfig =
      ''
        client.focused #E65100 #EF6C00 #FFFFFF #FB8C00 #E65100
      
      ''
    ;
  };
}
