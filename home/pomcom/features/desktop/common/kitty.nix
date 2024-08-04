{ config, lib, pkgs, ... }: {

  home.packages = with pkgs; [
    pixcat
    nnn
    presenterm
  ];

  programs.kitty = {
    enable = true;
    theme = "Space Gray Eighties";
    # theme = "Argonaut";
    font = {
      name = "Hack Nerd Font Mono";
      size = 14;
    };
  };
}



