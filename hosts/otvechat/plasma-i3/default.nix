{ inputs, lib, config, pkgs, ... }: {
  imports = [
    # ../common
    ../xorg
  ];

  services.xserver = {
    displayManager = {
      sddm.enable = true;
      defaultSession = "plasma+i3+otvechat";
      session = [
        {
          manage = "desktop";
          name = "plasma+i3+otvechat";
          start = ''exec env KDEWM=${pkgs.i3}/bin/i3 ${pkgs.plasma-workspace}/bin/startplasma-x11'';
        }
      ];
    };
    desktopManager.plasma5.enable = true;
    # windowManager.i3 = {
    #   enable = true;
    # };
  };

  systemd = {
    user.services.plasma-i3 = {
      description = "Use i3 as WM in KDE Plasma";
      wantedBy = [ "plasma-workspace.target" ];
      before = [ "plasma-workspace.target" ];
      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.i3}/bin/i3";
        Slice = "session.slice";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
    };
  };

  environment.systemPackages = [
    pkgs.xorg.xf86videointel
  ];
}
