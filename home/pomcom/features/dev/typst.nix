{ inputs, lib, pkgs, config, outputs, ... }:
{
  home.packages = with pkgs; [
    typst
    typstfmt
    typst-live
    typst-preview
  ];
}
