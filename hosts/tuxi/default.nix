{ config, pkgs, lib, inputs, user, outputs,  ... }:

{

  imports =
    [
    ./hardware-configuration.nix
    # ./tuxi/hardware-configuration.nix
    ../common/global
    ../common/users/pomcom
    ];

  services.greetd.settings.default_session.user = "pomcom";

  networking.hostName = "tuxi";
  networking.networkmanager.enable = true;

  boot.kernelPackages = pkgs.linuxKernel.packages.linux_zen;

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
    dconf.enable = true;
  };

  security.polkit.enable = true;
  hardware.bluetooth.enable = true;

  services.logind ={
    lidSwitch = "suspend";
    lidSwitchExternalPower = "lock";
  };


  virtualisation.vmware.host.enable = true;
  # virtualisation.virtualbox.host.enable = true;
  # virtualisation.virtualbox.host.enableExtensionPack = true;
  # virtualisation.virtualbox.guest.enable = true;
  # virtualisation.virtualbox.guest.x11 = true;
  virtualisation.docker.enable = true;

  xdg.portal = {
    enable = true;
    wlr.enable = true;
  };
  hardware = {
    opengl = {
      enable = true;
      extraPackages = with pkgs; [ amdvlk ];
      driSupport = true;
      driSupport32Bit = true;
    };
  };



  boot.initrd.secrets = {
    "/crypto_keyfile.bin" = null;
  };

# Enable swap on luks
  boot.initrd.luks.devices."luks-58bc2382-9c9c-436d-8d46-edf03f9f34c0".device = "/dev/disk/by-uuid/58bc2382-9c9c-436d-8d46-edf03f9f34c0";
  boot.initrd.luks.devices."luks-58bc2382-9c9c-436d-8d46-edf03f9f34c0".keyFile = "/crypto_keyfile.bin";

  time.timeZone = "Europe/Berlin";

# Select internationalisation properties.
  i18n.defaultLocale = "en_US.utf8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.utf8";
    LC_IDENTIFICATION = "de_DE.utf8";
    LC_MEASUREMENT = "de_DE.utf8";
    LC_MONETARY = "de_DE.utf8";
    LC_NAME = "de_DE.utf8";
    LC_NUMERIC = "de_DE.utf8";
    LC_PAPER = "de_DE.utf8";
    LC_TELEPHONE = "de_DE.utf8";
    LC_TIME = "de_DE.utf8";
  };



# Enable sound with pipewire.
  sound.enable = true;
  sound.mediaKeys.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
# If you want to use JACK applications, uncomment this
#jack.enable = true;
  };


  fonts.fonts = with pkgs; [
    (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" "Hack" ]; })
  ];






  system.stateVersion = "22.05";

}

