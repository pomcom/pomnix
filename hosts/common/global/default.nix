# This file (and the global directory) holds config that i use on all hosts
{ lib, inputs, outputs, ... }:
{
  imports = [
    # inputs.impermanence.nixosModules.impermanence
    inputs.home-manager.nixosModules.home-manager
     ./locale.nix
     ./nix.nix
  ] ++ (builtins.attrValues outputs.nixosModules);

  home-manager = {
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs outputs; };
  };

  nixpkgs = {
    overlays = builtins.attrValues outputs.overlays;
    config = {
      allowUnfree = true;
    };
  };

  environment = {
    # persistence = {
    #   "/persist".directories = [ "/var/lib/systemd" "/var/log" "/srv" ];
    # };
    enableAllTerminfo = true;
  };
  #
  # environment.variables = {
  #   QT_QPA_PLATFORMTHEME = "qt4ct";
  #   };
  #
  #

  #programs.fuse.userAllowOther = true;
  #hardware.enableRedistributableFirmware = false; #enabling this breaks mxmaster

  # Increase open file limit for sudoers
  # security.pam.loginLimits = [
  #   {
  #     domain = "@wheel";
  #     item = "nofile";
  #     type = "soft";
  #     value = "524288";
  #   }
  #   {
  #     domain = "@wheel";
  #     item = "nofile";
  #     type = "hard";
  #     value = "1048576";
  #   }
  # ];
}
