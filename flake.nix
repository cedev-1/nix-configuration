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

    clevo-xsm-wmi.url = "github:cedev-1/clevo-xsm-wmi-nix";
  };

  outputs = { nixpkgs, home-manager, opencode, caelestia-shell, clevo-xsm-wmi, ... }: {
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
          ({ lib, ... }: {
            _module.args = {
              clevo-xsm-wmi-pkg = clevo-xsm-wmi.packages.x86_64-linux.default;
            };
          })
        ];
      };
    };
  };
}
