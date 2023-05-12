{ pkgs, ... }:

  
    /* environment.packages = with pkgs; [ */
    /*   docker-compose */
    /**/
    /* ]; */

    {
      virtualisation = {

        docker.enable = true;
        vmware.host.enable = true;

        # needed for vagrant
        libvirtd.enable = true;

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
  
