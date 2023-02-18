{ inputs, outputs, libs, config, pkgs, ... }:

{
  imports = [
    ../modules/desktop
      ../modules/common
      ../modules/shell/git.nix
      ../modules/desktop/rofi.nix
      ../modules/desktop/alacritty.nix
      ../modules/desktop/packages.nix

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
# Configure your nixpkgs instance
    config = {
# Disable if you don't want unfree packages
      allowUnfree = true;
# Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = (_: true);
    };
  };

  home = {
    username = "pomcom";
    homeDirectory = "/home/pomcom";
  };

# Add stuff for your user as you see fit:
# programs.neovim.enable = true;
 home.packages = with pkgs; [ 
   whois
   tmux
   zsh

   ];


  programs.home-manager.enable = true;
  programs.git.enable = true;
  programs.go.enable = true;

# Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  #
  # home-manager.environment.systemPackages = with import ../hosts/systemnix; [
  #   vim
  #     wget
  #     traceroute
  #     git
  #     openvpn
  #     htop
  #     file
  #     p7zip
  #     zip
  #     unzip
  #     tree
  # ];


  home.stateVersion = "22.05";
}  

