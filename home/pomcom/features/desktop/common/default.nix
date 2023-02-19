{ pkgs, lib, outputs, ... }:
{
  imports = [
# ./discord.nix
    ./keepassxc.nix
    ./obsidian.nix
      ./firefox.nix
      ./font.nix
      ./gtk.nix
      ./pavucontrol.nix
      ./qt.nix
      ./firefoxdev.nix
      ./thunderbird.nix
      ./apps.nix
  ];

  xdg.mimeApps.enable = true;
  home.packages = with pkgs; [
# xdg-utils-spawn-terminal
  ];
}
