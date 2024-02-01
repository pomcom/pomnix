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

    vmware = {
      host = {
        enable = true;
        extraPackages = with pkgs; [ xorg.xf86videovmware open-vm-tools linuxKernel.packages.linux_6_5.vmware];
      };
    };

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

