{ config, lib, pkgs, ... }: {

  programs.vscode = {
    enable = true;
    extensions = [
      pkgs.vscode-extensions.bbenoist.nix
      pkgs.vscode-extensions.valentjn.vscode-ltex
    ];
  };
}
