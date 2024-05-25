{ config, lib, pkgs , ... }:

{
  programs.tmux = {
    enable = true;
    tmuxinator.enable = true;
    extraConfig = builtins.readFile ./tmux.conf;
    prefix = "C-f";
    historyLimit = 50000;
    terminal = "screen-256color";
    escapeTime = 1;
    plugins = with pkgs.tmuxPlugins; [
      # extrakto
    ];
  };
}
