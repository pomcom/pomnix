{ pkgs, ... }: {

  home.packages = with pkgs; 

  [ 
    discord
    element-desktop
    teams-for-linux
    mattermost-desktop
    teamspeak_client
    signal-desktop
    slack

  ];
}
