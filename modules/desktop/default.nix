{ pkgs,   ... }:


{
  imports = [
    ./alacritty.nix
    ./i3.nix
    ./packages.nix
    ./rofi.nix
  ];

  packages = with pkgs; [
    # Add any packages that you want to be installed by default in this module
  ];
}

