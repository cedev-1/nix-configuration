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
    ../../modules/zsh/default.nix
  ];

  programs.caelestia = {
    enable = true;
    cli.enable = true;

    settings = {
      bar.status.showBattery = true;
      bar.status.showWifi = true;

      background.desktopClock = {
        enabled = true;
        position = "bottom-right";
        scale = 1.0;
      };
      
      general.battery.warnLevels = [
        {
          level = 20;
          title = "Low Battery";
          message = "Plug in your laptop!";
          icon = "battery_android_frame_2";
        }
        {
          level = 5;
          title = "Critical Battery";
          message = "PLUG IN NOW!!";
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
    ranger
    thunar
    grim
    slurp
    wl-clipboard
    neofetch
    sway
    wlogout
    kitty
    github-copilot-cli
    gh
    nix-direnv
    direnv
    google-chrome
    code-cursor
    vscode
    bruno
    discord
    vivaldi
    nextcloud-client
  ];

  hyprland.isLaptop = true;
  hyprland.isDualMonitor = false;
}
