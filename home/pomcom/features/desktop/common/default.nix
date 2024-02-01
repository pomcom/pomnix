{ pkgs, lib, outputs, ... }:
{
  imports = [
    ./keepassxc.nix
    ./obsidian.nix
    ./font.nix
    ./gtk.nix
    ./pavucontrol.nix
    ./firefoxdev.nix
    ./thunderbird.nix
    ./drawio.nix
    ./apps.nix
    ./obs.nix
    ./yubikey.nix
    ./communication.nix
    ./apps.nix
    ./flameshot.nix
    ./kitty.nix
    ./vscode.nix
  ];

  xdg.mimeApps.enable = false;
  home.packages = with pkgs; [
    # xdg-utils-spawn-terminal
  ];
}
