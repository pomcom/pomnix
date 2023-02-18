{ config, lib, pkgs, ... }:

{
  programs.git = {
    #package = pkgs.gitAndTools.gitFull;
    enable = true;
    userName = "pomcom";
    userEmail = "git@pomcom.email";
    aliases = {
      ci = "commit";
      co = "checkout";
      s = "status";
    };
  };
}
