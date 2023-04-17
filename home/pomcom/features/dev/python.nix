{ inputs, lib, pkgs, config, outputs, ... }:
{
  home.packages = with pkgs; [
    python3
  ];
}
