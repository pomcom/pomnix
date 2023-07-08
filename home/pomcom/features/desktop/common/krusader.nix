{ pkgs, ... }: {
  home.packages = with pkgs; [
    krusader
    kdiff3
    libsForQt5.kompare
    libsForQt5.libkomparediff2
    xxdiff
    krename


    ];
               }
