{ config, pkgs, lib, inputs, user, outputs,  ... }:


{

  imports =
    [
    ./tuxi/hardware-configuration.nix
       # ../homemanager/home.nix
    ];


  nixpkgs = {
# You can add overlays here
    overlays = [
# Add overlays your own flake exports (from overlays and pkgs dir):
      outputs.overlays.modifications
        outputs.overlays.additions

# You can also add overlays exported from other flakes:
# neovim-nightly-overlay.overlays.default

# Or define it inline, for example:
# (final: prev: {
#   hi = final.hello.overrideAttrs (oldAttrs: {
#     patches = [ ./change-hello-to-hi.patch ];
#   });
# })
    ];
    config = {
      allowUnfree = true;
    };
  };

  nix = {
    # This will add each flake input as a registry
    # To make nix3 commands consistent with your flake
    registry = lib.mapAttrs (_: value: { flake = value; }) inputs;

    # This will additionally add your inputs to the system's legacy channels
    # Making legacy nix commands consistent as well, awesome!
    nixPath = lib.mapAttrsToList (key: value: "${key}=${value.to.path}") config.nix.registry;

    settings = {
      # Enable flakes and new 'nix' command
      experimental-features = "nix-command flakes";
      # Deduplicate and optimize nix store
      auto-optimise-store = true;
    };
  };

# Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";

# Setup keyfile
  boot.initrd.secrets = {
    "/crypto_keyfile.bin" = null;
  };

# Enable swap on luks
  boot.initrd.luks.devices."luks-58bc2382-9c9c-436d-8d46-edf03f9f34c0".device = "/dev/disk/by-uuid/58bc2382-9c9c-436d-8d46-edf03f9f34c0";
  boot.initrd.luks.devices."luks-58bc2382-9c9c-436d-8d46-edf03f9f34c0".keyFile = "/crypto_keyfile.bin";

  networking.hostName = "nixos";
# networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

# Network proxy configuration
# networking.proxy.default = "http://user:password@proxy:port/";
# networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

# Enable networking
  networking.networkmanager.enable = true;

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

  security.polkit.enable = true;

  hardware.bluetooth.enable = true;

# CUPS priting service
#services.printing.enable = true;

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

  services = {
    xserver = {
      enable = false;
      libinput = {
        enable = false; # enable touchpad
          touchpad = {
            disableWhileTyping = true;
            naturalScrolling = true;
          };
      };
      desktopManager = {
        xterm.enable = false;
        xfce.enable = true;
      };
      videoDrivers = [
        "displaylink"
          "modsetting"
          "amdgpu"
      ];
      layout = "us,de";
      xkbOptions = "grp:alt_space_toggle";

      windowManager.i3 = {
        enable = true;
        package = pkgs.i3-gaps;
        extraPackages = with pkgs; [ i3status i3status-rust i3blocks];
      };

    };


  }; 

# users.users.pomcom = {
#   isNormalUser = true;
#   description = "pomcom";
#   extraGroups = [ "wireshark" "networkmanager" "wheel" "video" "input" "audio" "power" "docker"];
#   shell = pkgs.zsh;
#   packages = with pkgs; [
#   ];
# };


  users.users = {
    pomcom = {
# TODO: You can set an initial password for your user.
# If you do, you can skip setting a root password by passing '--no-root-passwd' to nixos-install.
# Be sure to change it (using passwd) after rebooting!
# initialPassword = "correcthorsebatterystaple";
      isNormalUser = true;
      openssh.authorizedKeys.keys = [
# TODO: Add your SSH public key(s) here, if you plan on using SSH to connect
      ];
      extraGroups = [ "wireshark" "networkmanager" "wheel" "video" "input" "audio" "power" "docker"];
    };
  };

# Virtualisation

  virtualisation.vmware.host.enable = true;
  virtualisation.virtualbox.host.enable = true;
  virtualisation.virtualbox.host.enableExtensionPack = true;
  virtualisation.virtualbox.guest.enable = true;
  virtualisation.virtualbox.guest.x11 = true;
  virtualisation.docker.enable = true;


  programs.wireshark.enable = true;
  programs.adb.enable = true;

# system profile packages. 
  environment.systemPackages = with pkgs; [
    vim
      wget
      traceroute
      git
      openvpn
      htop
      file
      p7zip
      zip
      unzip
      tree
  ];

  fonts.fonts = with pkgs; [
    (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" "Hack" ]; })
  ];


# List services that you want to enable:

  services.mullvad-vpn.enable = true;

# Enable the OpenSSH daemon.
# services.openssh.enable = true;

# Open ports in the firewall.
# networking.firewall.allowedTCPPorts = [ ... ];
# networking.firewall.allowedUDPPorts = [ ... ];
# Or disable the firewall altogether.
# networking.firewall.enable = false;



# Hardware support
  hardware = {
    opengl = {
      enable = true;
      driSupport = true;
    };
  };


  environment = {
    variables = {
      TERMINAL = "alacritty";
      EDITOR = "nvim";
      VISUAL = "nvim";
    };
  };

  xdg = {
    portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-wlr
          xdg-desktop-portal-gtk
      ];
    };
  };

  services.xserver.modules = [pkgs.xorg.xf86videoamdgpu];
  hardware.enableRedistributableFirmware = true;

  system.stateVersion = "22.05";

}

