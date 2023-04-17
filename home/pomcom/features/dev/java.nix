{ pkgs, ... }:

# i pray i do not need you anymore
{
  programs.java = {
    enable = true;
    package = pkgs.jdk17;
  };

  home.packages = with pkgs; [
    maven
  ];
}
