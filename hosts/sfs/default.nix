# sfs
{ config, pkgs, lib, inputs, user, outputs, ... }:

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
      ../common/opt/environment.nix
      ../common/opt/thunar.nix
      # ../../hosts
    ];

  nixpkgs.config.permittedInsecurePackages = [
    lib.optional
    (pkgs.obsidian.version == "0.4.16")
    "electron-25.9.0"
  ];

  services.cron = {
    enable = true;
  };

  services.greetd.settings.default_session.user = "pomcom";

  networking.hostName = "sfs";
  networking.networkmanager.enable = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;


  services.dbus.packages = [ pkgs.gcr ];

  services.udisks2.enable = true;
  services.fwupd.enable = false;

  powerManagement.powertop.enable = true;

  # needed for hashcat
  hardware.opengl.extraPackages = with pkgs; [
    rocm-opencl-icd
    rocm-opencl-runtime
  ];

  # networking.hostFiles = [ "/etc/nixos/local-hosts.nix" ];

  programs = {
    light.enable = true;
    adb.enable = false;
    zsh.enable = true;
    dconf.enable = true;
  };


  services.logind = {
    lidSwitch = "suspend";
    lidSwitchExternalPower = "lock";
  };

  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" "Hack" ]; })
    rPackages.fontawesome
  ];


  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?

}
