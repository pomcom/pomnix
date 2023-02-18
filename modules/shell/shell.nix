{ config, pkgs, lib, ... }:

{

  home.packages = with pkgs; [
    exa
  ];

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    enableSyntaxHighlighting = true;

    zplug = {
      enable = true;
      plugins = [
        { name = "mafredri/zsh-async"; }
        { name = "sindresorhus/pure"; }
        { name = "Grafcube/zplug-git"; }
        #{ name = "lib/completion.zsh";}
        { name = "zsh-users/zsh-autosuggestions"; }
      ];
    };

    history = {
      size = 100000;
      save = 1000000;
      share = true;
      expireDuplicatesFirst = true;
      ignoreSpace = true;
    };

    sessionVariables = {
      GPG_TTY = "$(tty)";
      MANPAGER = "sh -c 'col -bx | bat -l man -p'";
      PURE_NODE_ENABLED = 0;
      PURE_CMD_MAX_EXEC_TIME = 0;
      XDG_CONFIG_HOME = "$HOME/.config";
      PATH = "$PATH:$HOME/go/bin";
      GOPATH = "$HOME/go";
      };

      initExtra = ''

      bindkey "^[[1;5C" emacs-forward-word
      bindkey "^[[1;5D" emacs-backward-word
      '';
      shellAliases = {
      ls = "exa";
      ll = "ls -alh";
      la = "ls -a";
      ld = "ls -ad";
      tree = "la --tree";
      trees = "tree --depth 4";

      _ = "sudo";
      cat = "bat -p";
      grep = "grep --color";
      hg = "history 0 | grep";
      mycolors = "msgcat --color=test";
      view = "zathura";
      build = "sudo nixos-rebuild switch --flake .#";
    };
  };

  programs.autojump.enable = true;
  programs.bat.enable = true;
  
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    tmux.enableShellIntegration = false;
  };

  programs.vim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      vim-surround
    ];
    settings = {
      number = true;
      relativenumber = true;
      ignorecase = true;
      hidden = true;
      tabstop = 2;
      expandtab = true;
    };
  };

}
