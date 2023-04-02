{ pkgs, lib, outputs, ... }:
{
  imports = [
# ./discord.nix
    ./keepassxc.nix
      ./obsidian.nix
      ./font.nix
      ./gtk.nix
      ./pavucontrol.nix
      ./qt.nix
      ./firefoxdev.nix
      ./thunderbird.nix
      ./drawio.nix
      ./apps.nix
      ./obs.nix
  ];

  xdg.mimeApps.enable = true;
  home.packages = with pkgs; [
# xdg-utils-spawn-terminal
  ];
}
