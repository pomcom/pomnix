{ pkgs, ... }:

{

 environment.systemPackages = [ 
   
   pkgs.distrobox
   pkgs.boxbuddy
   pkgs.podman-tui
 ]; 

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
        extraPackages = with pkgs; [ xorg.xf86videovmware open-vm-tools ];
      };
    };

    libvirtd.enable = true;

    # virtualbox = {
    #   host = {
    #     enable = false;
    #     enableExtensionPack = true;
    #     # users.extraGroups.vboxusers.members = [ "pomcom" ];
    #   };
    #   guest = {
    #     enable = true;
    #     # x11 = true;
    #   };
    # };

  };
}

