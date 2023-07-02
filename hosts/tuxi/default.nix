{ config, pkgs, lib, inputs, user, outputs,  ... }:

{
  imports =
    [
    ./hardware-configuration.nix

    ./x11/default.nix

    ../common/global
    ../common/users/pomcom

    ../common/opt/virtualisation.nix
    ../common/opt/polkit.nix
    ../common/opt/pipewire.nix
    ];

  services.greetd.settings.default_session.user = "pomcom";

  hardware.tuxedo-control-center.enable = true;

  networking.hostName = "tuxi";
  networking.networkmanager.enable = true;

  # boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.kernelPackages = pkgs.linuxKernel.packages.linux_5_15;
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";

  services.dbus.packages = [ pkgs.gcr ];

  services.mullvad-vpn.enable = true;
  services.udisks2.enable = true;

  powerManagement.powertop.enable = true;

  programs = {
    light.enable = true;
    adb.enable = true;
    zsh.enable = true;
    dconf.enable = true;
  };


  # security.pki.certificateFiles = [
  #   "${pkgs.cacert}/etc/ssl/certs/Spike+Rocks+CA.crt"
  #   "${pkgs.cacert}/etc/ssl/certs/spike.local+intermediate+CA.crt"
  #
  # ];

  networking.extraHosts = 
  ''
    10.12.12.5 seafile.spike.local
    10.12.12.4 git.spike.local
    10.12.12.6 ipa.spike.local
  '';


  hardware.bluetooth.enable = true;

  services.logind ={
    lidSwitch = "suspend";
    lidSwitchExternalPower = "lock";
  };

  boot.initrd.secrets = {
    "/crypto_keyfile.bin" = null;
  };

# Enable swap on luks
  boot.initrd.luks.devices."luks-56623f99-0ed3-40f0-8ff6-e00f258889b2".device = "/dev/disk/by-uuid/56623f99-0ed3-40f0-8ff6-e00f258889b2";
  boot.initrd.luks.devices."luks-56623f99-0ed3-40f0-8ff6-e00f258889b2".keyFile = "/crypto_keyfile.bin";

  # time.timeZone = "Europe/Berlin";

# # Select internationalisation properties.
#   i18n.defaultLocale = "en_US.utf8";
#
#   i18n.extraLocaleSettings = {
#     LC_ADDRESS = "de_DE.utf8";
#     LC_IDENTIFICATION = "de_DE.utf8";
#     LC_MEASUREMENT = "de_DE.utf8";
#     LC_MONETARY = "de_DE.utf8";
#     LC_NAME = "de_DE.utf8";
#     LC_NUMERIC = "de_DE.utf8";
#     LC_PAPER = "de_DE.utf8";
#     LC_TELEPHONE = "de_DE.utf8";
#     LC_TIME = "de_DE.utf8";
#   };
#
#
  
  nixpkgs.config.permittedInsecurePackages = [
    "openssl-1.1.1u"
    "nodejs-14.21.3"
    "electron-13.6.9"
  ];
#
#
#
# Enable sound with pipewire.
  # sound.enable = true;
  sound.mediaKeys.enable = true;
  hardware.pulseaudio.enable = false;


  fonts.fonts = with pkgs; [
    (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" "Hack" ]; })
    rPackages.fontawesome
  ];

 security.pki.certificateFiles = [
   "${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt"
    "/home/pomcom/reply/certs/Spike+Rocks+CA.crt"
    "/home/pomcom/reply/certs/spike.local+intermediate+CA.crt"



 ];


  system.stateVersion = "22.05";

}

