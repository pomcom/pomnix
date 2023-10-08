{ pkgs, ... }:

  
    /* environment.packages = with pkgs; [ */
    /*   docker-compose */
    /**/
    /* ]; */


    {
      virtualisation = {

        docker.enable = true;
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
  
