{ config, pkgs, lib, inputs, user, outputs, ... }:

{

  imports = [
    ./hardware-configuration.nix

    ../tuxi/x11/default.nix

    ../common/global
    ../common/users/pomcom

    ../common/opt/virtualisation.nix
  ];

  fonts.fonts = with pkgs; [
    pkgs.rPackages.fontawesome
  
];

  networking = {
    hostName = "otvechat";
    networkmanager.enable = true;
  };


   networking.extraHosts = ''
     10.12.12.5 seafile.spike.local
     10.12.12.4  git.spike.local
   '';

  services = {
    dbus.packages = [ pkgs.gcr ];

    printing.enable = true;

    mullvad-vpn.enable = true;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
  };

  # Enable sound with pipewire.
  sound.enable = true;
  hardware = {
    pulseaudio.enable = false;
    bluetooth.enable = true;

  };

  security.rtkit.enable = true;

  boot.loader = {
    systemd-boot.enable = true;
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot/efi";
    };
  };

  boot.initrd = {
    secrets = {
      "/crypto_keyfile.bin" = null;
    };
    luks.devices."luks-a5f275df-2aeb-424f-aff8-2c1988c84ac1" = {
      device = "/dev/disk/by-uuid/a5f275df-2aeb-424f-aff8-2c1988c84ac1";
      keyFile = "/crypto_keyfile.bin";
    };
  };

  programs = {
    light.enable = true;
    adb.enable = true;
    dconf.enable = true;
    zsh.enable = true;
  };

  /* environment.plasma5.excludePackages = with pkgs.libsForQt5; [ */
  /*   plasma-browser-integration */
  /*   kwallet */
  /*   kwalletmanager */
  /**/
  /* ]; */

  system.stateVersion = "22.05";

  # TODO: Remove commented code

  # security.pki.certificateFiles = [
  #   "${pkgs.cacert}/etc/ssl/certs/Spike+Rocks+CA.crt"
  #   "${pkgs.cacert}/etc/ssl/certs/spike.local+intermediate+CA.crt"
  #
  # ];

  # networking.extraHosts = ''
  #   10.12.12.5 seafile.spike.local
  # '';

  #  hardware = {
  #    opengl = {
  #      enable = true;
  #      extraPackages = with pkgs; [ amdvlk ];
  #      driSupport = true;
  #      driSupport32Bit = true;
  #    };
  #  };

}

