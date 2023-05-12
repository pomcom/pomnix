{ config, pkgs, lib, ... }:

{

  programs.zsh = {
    enable = true;
    enableCompletion = false;
    enableAutosuggestions = true;
    enableSyntaxHighlighting = true;
    defaultKeymap = "emacs";

    zplug = {
      enable = true;
      plugins = [
        { name = "mafredri/zsh-async"; }
        { name = "sindresorhus/pure"; }
        /* { name = "Grafcube/zplug-git"; } */
        #{ name = "lib/completion.zsh";}
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

      # helper to make modifiable copy of immutable link to nix store
      function tinker() {
        FILE=$1
        mv $1 $1.bak
        cp $1.bak $1
        chmod +w $1
        vi $1
      }

      bindkey "^[[1;5C" emacs-forward-word
      bindkey "^[[1;5D" emacs-backward-word
      '';
    shellAliases = {

      myip = "curl ifconfig.me";
      ls = "exa";
      ll = "ls -alh";
      la = "ls -a";
      ld = "ls -ad";
      tree = "la --tree";
      trees = "tree --depth 4";

      ".." = "cd ../";
      "..." = "cd ../../";
      "...." = "cd ../../../";
      "....." = "cd ../../../../";
      "......" = "cd ../../../../../";

      _ = "sudo";
      cat = "bat -p";
      grep = "grep --color";
      hg = "history 0 | grep";
      mycolors = "msgcat --color=test";
      view = "zathura";
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
