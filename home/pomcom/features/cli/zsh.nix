{ config, pkgs, lib, ... }:

{

  programs.zsh = {
    enable = true;
    enableCompletion = false;
    enableAutosuggestions = true;
    syntaxHighlighting.enable = true;
    defaultKeymap = "emacs";

    zplug = {
      enable = true;
      plugins = [
        { name = "mafredri/zsh-async"; }
        { name = "sindresorhus/pure"; }
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
      #MANPAGER = "sh -c 'col -bx | bat -l man -p'";
      PURE_NODE_ENABLED = 0;
      PURE_CMD_MAX_EXEC_TIME = 0;
      XDG_CONFIG_HOME = "$HOME/.config";
      PATH = "$PATH:$HOME/go/bin";
      GOPATH = "$HOME/go";
      GTK_THEME = "Orchis-Grey-Dark-Compact";
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
      ll = "exa -lbF --git";
      llm = "exa -lbGd --git --sort=modified";

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

      # pbcopy and pbpaste
      pbcopy = "xclip -selection clipboard";
      pbpaste = "xclip -selection clipboard -o";

      nmap_open_ports = "nmap --open";
      nmap_list_interfaces = "nmap --iflist";
      nmap_slow = "sudo nmap -sS -v -T1";
      nmap_fin = "sudo nmap -sF -v";
      nmap_full = "sudo nmap -sS -T4 -PE -PP -PS80,443 -PY -g 53 -A -p1-65535 -v";
      nmap_check_for_firewall = "sudo nmap -sA -p1-65535 -v -T4";
      nmap_ping_through_firewall = "nmap -PS -PA";
      nmap_fast = "nmap -F -T5 --version-light --top-ports 300";
      nmap_detect_versions = "sudo nmap -sV -p1-65535 -O --osscan-guess -T4 -Pn";
      nmap_check_for_vulns = "nmap --script=vuln";
      nmap_full_udp = "sudo nmap -sS -sU -T4 -A -v -PE -PS22,25,80 -PA21,23,80,443,3389 ";
      nmap_traceroute = "sudo nmap -sP -PE -PS22,25,80 -PA21,23,80,3389 -PU -PO --traceroute ";
      nmap_full_with_scripts = "sudo nmap -sS -sU -T4 -A -v -PE -PP -PS21,22,23,25,80,113,31339 -PA80,113,443,10042 -PO --script all ";
      nmap_web_safe_osscan = "sudo nmap -p 80,443 -O -v --osscan-guess --fuzzy ";
      nmap_ping_scan = "nmap -n -sP";

      p = "termpdf.py";
      i = "pixcat";

    };
  };

  programs.autojump.enable = true;

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    tmux.enableShellIntegration = false;
  };

  programs.atuin = {
    enable = true;
    flags = [
      "--disable-up-arrow"
    ];
    settings = {
      style = "compact";
    };
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
