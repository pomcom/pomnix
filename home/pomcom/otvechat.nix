{ inputs, pkgs, ... }: {
  imports = [
    ./global
     ./features/services/picom.nix
     ./features/services/nextcloud.nix
     ./features/desktop/i3/config.nix
     

     ./features/desktop/common/flameshot.nix
     ./features/desktop/common/obsidian.nix
     ./features/desktop/common/keepassxc.nix
     ./features/desktop/common/firefoxdev.nix

  ];

  home.packages = with pkgs; [
      kde-gruvbox
      vscode

      libsForQt5.kalendar
      libsForQt5.bluedevil
      bluez5

      gitkraken
      libreoffice-qt
      hunspell
# move pkgs to own files, add hunspell language pkgs


      alacritty
      ferdium
      nomachine-client
      seafile-client
      spotify

      chromium
      kate
      openvpn
      signal-desktop
  ];
}
