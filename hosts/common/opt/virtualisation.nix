{ pkgs, ... }:


/* environment.packages = with pkgs; [ */
/*   docker-compose */
/**/
# podman-tui
/* ]; */

{
  virtualisation = {

    docker.enable = true;
    podman = {
      enable = true;
      dockerCompat = false;
      defaultNetwork.settings.dns_enabled = true;
    };
    vmware.host.enable = true;

    libvirtd.enable = true;

    virtualbox = {
      host = {
        enable = false;
        enableExtensionPack = true;
      };
      guest = {
        enable = true;
        x11 = true;
      };
    };
  };

}
  
