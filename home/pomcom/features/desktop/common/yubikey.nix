{ pkgs, ... }: {
  home.packages = with pkgs; [
    yubikey-agent
    yubikey-manager-qt
    yubikey-personalization-gui
  ];
}
