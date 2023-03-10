{
  description = "pomcoms nix config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/hyprland/v0.21.0beta";
    hyprwm-contrib.url = "github:hyprwm/contrib";
  };

 outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      inherit (self) outputs;
      forEachSystem = nixpkgs.lib.genAttrs [ "x86_64-linux" "aarch64-linux" ];
      forEachPkgs = f: forEachSystem (sys: f nixpkgs.legacyPackages.${sys});
    in
    {
      nixosModules = import ./modules/nixos;
      homeManagerModules = import ./modules/home-manager;
      # templates = import ./templates;

      overlays = import ./overlays { inherit inputs outputs; };
      # hydraJobs = import ./hydra.nix { inherit inputs outputs; };

      packages = forEachPkgs (pkgs: import ./pkgs { inherit pkgs; });
      devShells = forEachPkgs (pkgs: import ./shell.nix { inherit pkgs; });
      formatter = forEachPkgs (pkgs: pkgs.nixpkgs-fmt);


# NixOS configuration entrypoint
# Available through 'nixos-rebuild --flake .#your-hostname'

      nixosConfigurations = {

        tuxi = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          modules = [ ./hosts/tuxi ];
        };
      };

    


# Standalone home-manager configuration entrypoint
# Available through 'home-manager --flake .#your-username@your-hostname'


      homeConfigurations = {
        "pomcom@tuxi" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux; 
          extraSpecialArgs = { inherit inputs outputs; };
          modules = [ ./home/pomcom/tuxi.nix ];
        };
      };
    };
}

