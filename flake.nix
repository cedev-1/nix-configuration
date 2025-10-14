{
  description = "cedev nixos config";
  # sudo nixos-rebuild switch --flake /etc/nixos#cedev-nixos
  # sudo nixos-rebuild switch --flake /etc/nixos#cedev-laptop

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.05";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }: {    
    nixosConfigurations = {
      cedev-nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/morty/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.users.cedev = import ./hosts/morty/home.nix;
          }
        ];
      };
      cedev-laptop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/thorfinn/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.users.cedev = import ./hosts/thorfinn/home.nix;
          }
        ];
      };
    };
  };
}
