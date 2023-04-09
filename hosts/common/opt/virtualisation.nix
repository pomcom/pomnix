{ pkgs, ... }:
{
  virtualisation = {
    docker.enable = true;

    vmware.host.enable = true;

    virtualbox = {
      host = {
        enable = true;
        enableExtensionPack = true;
      };    
      guest = {
        enable = true;
        x11 = true;
      };
    };
  };
}
