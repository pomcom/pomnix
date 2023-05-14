{ inputs, pkgs, ... }: {
  imports = [
    ./global
    ./features/services/picom.nix
    ./features/services/nextcloud.nix
    ./features/services/syncthing.nix
    ./features/desktop/i3/config.nix

    ./features/dev/java.nix


    ./features/desktop/common/flameshot.nix
    ./features/desktop/common/obsidian.nix
    ./features/desktop/common/keepassxc.nix
    ./features/desktop/common/firefoxdev.nix
    ./features/desktop/common/yubikey.nix
    ./features/desktop/common/font.nix

  ];

  home.packages = with pkgs; [
    kde-gruvbox
    vscodium

    thunderbird 
    onedrive
    discord
    gitkraken
    libreoffice-qt
    hunspell
    # move pkgs to own files, add hunspell language pkgs


    alacritty
    ferdium
    nomachine-client
    seafile-client
    spotify

    vagrant

    chromium
    signal-desktop
  ];
}
