{ config, pkgs, caelestia-shell, ... }:

{
  home.username = "cedev";
  home.homeDirectory = "/home/cedev";
  home.stateVersion = "25.05";
 
  nixpkgs.config.allowUnfree = true;

  home.file.".p10k.zsh".source = ../../dotfiles/p10k.zsh;

  imports = [
    caelestia-shell.homeManagerModules.default
    ../../modules/hyprland/default.nix
    ../../modules/ranger/default.nix
    ../../modules/kitty/default.nix
    ../../modules/rofi/default.nix
    ../../modules/zsh/default.nix
  ];

  programs.caelestia = {
    enable = true;
    cli.enable = true;

    settings = {
      bar.status.showBattery = true;
      bar.status.showWifi = true;
      
      general.battery.warnLevels = [
        {
          level = 20;
          title = "Batterie Faible";
          message = "Pense à brancher Thorfinn !";
          icon = "battery_android_frame_2";
        }
        {
          level = 5;
          title = "Niveau Critique";
          message = "BRANCHE LE CHARGEUR MAINTENANT !!";
          icon = "battery_android_alert";
          critical = true;
        }
      ];

      paths.wallpaperDir = "~/Pictures/Wallpapers";
      
      general.apps = {
        terminal = ["kitty"];
        audio = ["pavucontrol"];
        explorer = ["thunar"];
      };
    };
  };

  programs.git = {
    enable = true;
    settings = {
      user.name = "cedev-1";
      user.email = "cedevserver@gmail.com";
    };
  };

  programs.direnv = {
  enable = true;
  };

  home.sessionVariables = {
    TERMINAL = "kitty";
  };

  gtk.enable = true;
  
  gtk.gtk3.theme = {
    name = "Adwaita-dark";
  };

  home.packages = with pkgs; [
    # LANGUAGES / PACKAGES
    python314
    gcc    
    
    opentofu
    ansible
    kubernetes-helm
    kubectl
    kind

    tree
    pavucontrol
    bluetui

    # File manager and utilities
    ranger
    thunar
    grim
    slurp
    wl-clipboard
    neofetch
    sway
    swaybg
    wlogout

    # TERMINAL
    kitty
    github-copilot-cli
    gh
    
    nix-direnv
    direnv
    
    # APP
    google-chrome
    code-cursor
    vscode
    bruno
    discord
    vivaldi
    nextcloud-client
  ];

  hyprland.isDualMonitor = false;
}
