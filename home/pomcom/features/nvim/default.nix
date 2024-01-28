{ config, lib, pkgs, user, ... }:

{
  programs.neovim = {

    enable = true;
    defaultEditor = true;
    package = pkgs.neovim-nightly;

    vimAlias = true;
    vimdiffAlias = true;

    withNodeJs = true;
    withPython3 = true;

    extraPackages = with pkgs; [
      # Language Servers
      # gopls
      # rnix-lsp
      lua-language-server
      # java-language-server
    ];

  };

  xdg.configFile = {
    nvim = {
      source = ./config/nvim;
      recursive = true;
    };
  };
}
