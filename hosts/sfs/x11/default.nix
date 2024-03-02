{ pkgs, ... }:

{

  environment.systemPackages = [

    pkgs.xorg.xf86videoamdgpu
    pkgs.xclip
    #pkgs.light
    pkgs.playerctl
    pkgs.pamixer
    pkgs.mpv
    pkgs.arandr
    pkgs.nitrogen
    pkgs.i3lock-fancy
    pkgs.wmctrl
    pkgs.volumeicon
    pkgs.xorg.xf86videovmware
    pkgs.virt-manager
    #pkgs.vagrant
    pkgs.seafile-client
    #pkgs.citrix_workspace
    pkgs.networkmanager-openvpn
  ];

  services.xserver = {
    enable = true;
    desktopManager = {
      xterm.enable = false;
      xfce = {
        enable = true;
        noDesktop = true;
        enableXfwm = false;
      };
    };
    displayManager.defaultSession = "xfce+i3";
    windowManager.i3.package = pkgs.i3-gaps;
    windowManager.i3.enable = true;
  };

  # Configure keymap in X11
  services.xserver = {
    xkb = {
      variant = "";
      layout = "us";
    };
    videoDrivers = [ "amdgpu" ];
  };

}
