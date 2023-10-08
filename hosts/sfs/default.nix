# sfs
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
    ../common/opt/environment.nix
    ];

services.greetd.settings.default_session.user = "pomcom"; 

networking.hostName = "sfs"; 
networking.networkmanager.enable = true;


boot.kernelPackages = pkgs.linuxKernel.packages.linux_6_4;

boot.loader.systemd-boot.enable = true;
boot.loader.efi.canTouchEfiVariables = true;


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

   nixpkgs.config.permittedInsecurePackages = [
    "openssl-1.1.1w"
    "nodejs-14.21.3"
    "electron-13.6.9"
  ]; 

 services.logind ={
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
