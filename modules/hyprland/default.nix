{ config, lib, pkgs, ... }:
let
  monitors = import ./config/monitors.nix { inherit config; };
  keybindings = import ./config/keybindings.nix;
  animations = import ./config/animations.nix;
  autostart = import ./config/autostart.nix { inherit config; };
  windowrules = import ./config/windowrules.nix;
in {
  options.hyprland = {
    isDualMonitor = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "dual monitors.";
    };
    isLaptop = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "laptop.";
    };
  };

  config = {
    xdg.configFile."hypr/hyprland.conf".text = ''
  ${monitors}
  ${keybindings}
  ${animations}
  ${autostart}
  ${windowrules}

  '';
  };
}
