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

    opencode.url = "github:cedev-1/opencode-nix/update-to-1.1.14";

    caelestia-shell = {
      url = "github:caelestia-dots/shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, opencode, caelestia-shell, ... }: {
    nixosConfigurations = {
      cedev-nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/morty/configuration.nix
          home-manager.nixosModules.home-manager
          {
            nixpkgs.overlays = [ opencode.overlays.default ];
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
            home-manager.extraSpecialArgs = { inherit caelestia-shell; };
            home-manager.users.cedev = import ./hosts/thorfinn/home.nix;
          }
        ];
      };
    };
  };
}
