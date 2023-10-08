{
  description = "pomcoms nix config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nixpkgs-master.url = "github:nixos/nixpkgs/master";


    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/hyprland/v0.21.0beta";
    hyprwm-contrib.url = "github:hyprwm/contrib";
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
    
    tuxedo-nixos = {
      url = "github:blitz/tuxedo-nixos";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops-nix = {
      url = "github:mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.nixpkgs-stable.follows = "nixpkgs";
  };


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
# nixos-rebuild build --flake .#your-hostname
# nixos-rebuild switch --flake .#otvechat

      nixosConfigurations = {

        tuxi = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          modules = [ 
          ./hosts/tuxi
          inputs.tuxedo-nixos.nixosModules.default
          ];
        };

        otvechat = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          modules = [
          ./hosts/otvechat
          inputs.tuxedo-nixos.nixosModules.default
          ];
      };

        sfs = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          modules = [ 
          ./hosts/sfs
          ];
        };


# Standalone home-manager configuration entrypoint
# Available through 'home-manager --flake .#your-username@your-hostname'
      defaultPackage.x86_64-linux = home-manager.defaultPackage.x86_64-linux;

      homeConfigurations = {
        "pomcom@tuxi" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux; 
          extraSpecialArgs = { inherit inputs outputs; };
          modules = [ ./home/pomcom/tuxi.nix];
        };

        "pomcom@parrot" = home-manager.lib.homeManagerConfiguration {
          defaultPackage.x86_64-linux = home-manager.defaultPackage.x86_64-linux;
          pkgs = nixpkgs.legacyPackages.x86_64-linux; 
          extraSpecialArgs = { inherit inputs outputs; };
          modules = [ ./home/pomcom/parrot.nix];
        };

      };
    };
  };
}

