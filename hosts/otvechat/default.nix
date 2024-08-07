# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [
      # Include the results of the hardware scan.
      ./hardware-configuration.nix

      ./x11/default.nix

      ../common/global
      ../common/users/pomcom


      ../common/opt/virtualisation.nix
      ../common/opt/clam.nix
      ../common/opt/polkit.nix
      ../common/opt/pipewire.nix
      ../common/opt/environment.nix
      ../common/opt/mullvad.nix
    ];

  
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "otvechat"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;


  services.cron = {
    enable = false;
  };

  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = [ "pomcom" ];


  networking.extraHosts = 
    ''
    10.11.11.254    gw.spike.local
    10.11.11.1    vm.spike.local
    10.12.12.4     git.spike.local
    10.12.12.5    seafile.spike.local
    10.12.12.6    ipa.spike.local
    10.12.12.7    doc.spike.local
    10.12.12.20    kali.spike.local kali-scan.spike.local nessus.spike.local scan.spike.local
    10.12.12.10    jenkins.spike.local
    10.12.12.34    burp.spike.local
    ''
    ;



# Enable the X11 windowing system.
#services.xserver.enable = true;

  # Enable the XFCE Desktop Environment.
  #services.xserver.displayManager.lightdm.enable = true;
  #services.xserver.desktopManager.xfce.enable = true;

  # Configure keymap in X11

  #services.xserver = {
  # layout = "us";
  # xkbVariant = "";
  #};


  hardware.bluetooth.enable = true;

  programs = {

    zsh.enable = true;
    adb.enable = true;

  };


  # Enable touchpad support (enabled default in most desktopManager)
  # services.xserver.libinput.enable = true;


  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

}
