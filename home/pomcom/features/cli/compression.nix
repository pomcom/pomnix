{ config, pkgs, lib, ... }:
{
  home.packages = with pkgs; [

    p7zip
    unzip
    zip
  ];
}
