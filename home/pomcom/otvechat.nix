{ inputs, pkgs, ... }: {
  imports = [
    ./global
     ./features/services/picom.nix
     ./features/desktop/i3/config.nix
  ];

  home.packages = with pkgs; [
      firefox
      kde-gruvbox
      vscode

      libsForQt5.kalendar

      gitkraken
      libreoffice-qt
      hunspell
# move pkgs to own files, add hunspell language pkgs


      alacritty
      ferdium
      keepassxc
      nomachine-client

      chromium
      kate
      openvpn
      signal-desktop
  ];
}
