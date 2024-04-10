{ config, lib, pkgs, ... }:


{
programs.wezterm = {
  enable = true;
  extraConfig = builtins.readfile ./config.lua;
};
}
