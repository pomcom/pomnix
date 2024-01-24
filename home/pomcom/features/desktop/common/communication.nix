{ pkgs, ... }: {

  home.packages = with pkgs;

    [
      discord
      betterdiscordctl
      element-desktop
      mattermost-desktop
      teamspeak_client
      signal-desktop
      slack
      hexchat

    ];
}
