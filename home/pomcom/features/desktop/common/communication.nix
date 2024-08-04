{ pkgs, ... }: {

  home.packages = with pkgs;

    [
      discord
      betterdiscordctl
      element-desktop
      teamspeak_client
      signal-desktop
      slack
      hexchat
      ferdium
    ];
}
