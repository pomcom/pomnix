{ inputs, lib, config, ... }:

{
  imports = [
    inputs.sops-nix.nixosModules.sops
  ];

   sops.defaultSopsFile = ../../../secrets.yml;

   sops.gnupg.home = "/home/pomcom/.gnupg"; 
   sops.secrets.networking = {
      format = "yaml";
      sopsFile = ../../../secrets.yml;

    };


}

