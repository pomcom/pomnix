{ pkgs, lib, outputs, ... }:

{
  environment.sessionVariables = {
    QT_QPA_PLATFORMTHEME = "qt5ct";
  };
}
