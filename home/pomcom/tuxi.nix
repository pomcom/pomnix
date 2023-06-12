{ inputs, pkgs, ... }: {
  imports = [

    ./global


   ./features/desktop/common/apps.nix
   ./features/desktop/common/keepassxc.nix
   ./features/desktop/common/obsidian.nix
   ./features/desktop/common/firefoxdev.nix
   ./features/desktop/common/flameshot.nix
   ./features/desktop/common/thunderbird.nix
   ./features/desktop/common/pavucontrol.nix
   ./features/desktop/common/kitty.nix
   ./features/desktop/common/font.nix

    ./features/dev/java.nix

   ./features/desktop/common/wayland-wm/alacritty.nix

   #./features/desktop/common/gtk.nix
   
   ./features/services/nextcloud.nix
   ./features/services/udiskie.nix
   ./features/services/syncthing.nix
   ./features/services/blueman.nix
   ./features/services/picom.nix

   ./features/desktop/i3/tuxi-config.nix

   
  

   
  ];

  home.packages = with pkgs; [
    libreoffice-fresh
    
      ];
                       }
