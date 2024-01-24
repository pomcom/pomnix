{ config, pkgs, lib, inputs, user, outputs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix

      ./x11/default.nix

      ../common/global
      ../common/users/pomcom

      ../common/opt/virtualisation.nix
      ../common/opt/clam.nix
      ../common/opt/polkit.nix
      ../common/opt/pipewire.nix
      ../common/opt/environment.nix
    ];

  services.greetd.settings.default_session.user = "pomcom";

  hardware.tuxedo-control-center.enable = true;

  networking.hostName = "tuxi";
  networking.networkmanager.enable = true;

  networking.wireless.networks."37C3".auth = ''
    key_mgmt=WPA-EAP
    eap=TTLS
    identity="37C3"
    password="37C3"
    ca_cert="${builtins.fetchurl {
      url = "https://letsencrypt.org/certs/isrgrootx1.pem";
      sha256 = "sha256:1la36n2f31j9s03v847ig6ny9lr875q3g7smnq33dcsmf2i5gd92";
    }}"
    altsubject_match="DNS:radius.c3noc.net"
    phase2="auth=PAP"
  '';


  # boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.kernelPackages = pkgs.linuxKernel.packages.linux_5_15;
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";

  services.dbus.packages = [ pkgs.gcr ];

  services.mullvad-vpn.enable = true;
  services.udisks2.enable = true;
  services.fwupd.enable = false;

  powerManagement.powertop.enable = true;

  programs = {
    light.enable = true;
    adb.enable = false;
    zsh.enable = true;
    dconf.enable = true;
  };

  # networking.extraHosts = let
  #   sopsSecrets = config.sops.secrets.networking;
  #   decryptedExtraHosts = lib.mkIf (sopsSecrets != null) sopsSecrets.extraHosts;
  # in
  # lib.optionals decryptedExtraHosts [];

  # networking.extraHosts = {
  #   config.sops.secrets.networking.extraHosts;
  #   };



  # sops.secrets.networking = {
  #   secretFile = ../../secrets.yml;
  #
  # };

  # networking.extraHosts = config.sops.secrets.networking.extraHosts;

  networking.extraHosts =
    ''
      10.12.12.5 seafile.spike.local
      10.12.12.4 git.spike.local
      10.12.12.6 ipa.spike.local
      10.12.12.20    kali.spike.local kali-scan.spike.local nessus.spike.local scan.spike.local
    '';

  hardware.bluetooth.enable = true;

  services.logind = {
    lidSwitch = "suspend";
    lidSwitchExternalPower = "lock";
  };

  boot.initrd.secrets = {
    "/crypto_keyfile.bin" = null;
  };

  # Enable swap on luks
  boot.initrd.luks.devices."luks-56623f99-0ed3-40f0-8ff6-e00f258889b2".device = "/dev/disk/by-uuid/56623f99-0ed3-40f0-8ff6-e00f258889b2";
  boot.initrd.luks.devices."luks-56623f99-0ed3-40f0-8ff6-e00f258889b2".keyFile = "/crypto_keyfile.bin";

  nixpkgs.config.permittedInsecurePackages = [
    "openssl-1.1.1w"
    "nodejs-14.21.3"
    "electron-13.6.9"
  ];
  #
  # Enable sound with pipewire.
  # sound.enable = true;
  sound.mediaKeys.enable = true;
  hardware.pulseaudio.enable = false;

  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" "Hack" ]; })
    rPackages.fontawesome
  ];

  system.stateVersion = "22.05";

}

