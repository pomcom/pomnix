{ config, lib, ... }:

{
  programs.tmux = {
    enable = true;
    prefix = "C-f";
    historyLimit = 50000;
    extraConfig = ''

    # move around panes with hjkl
    bind h select-pane -L
    bind j select-pane -D
    bind k select-pane -U
    bind l select-pane -R

    # toggle status bar
    bind-key q set-option status

    # upgrade $TERM
     set -g default-terminal "screen-256color"

    setw -g mouse on 
    # center windows in status line
    set -g status-justify centre

    # status bar colors
    set-option -g status-style bg=default # transparent bg
    set -g status-fg white
    set-window-option -g window-status-current-style fg=black,bg=white

    set -g display-time 4000

    '';
  };
}
