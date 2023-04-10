{ inputs, pkgs, ... }: {
  imports = [
    ./global
     ./features/services/picom.nix
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

      gitkraken
      libreoffice-qt
      hunspell
# move pkgs to own files, add hunspell language pkgs


      alacritty
      ferdium
      nomachine-client

      chromium
      kate
      openvpn
      signal-desktop
  ];
}
