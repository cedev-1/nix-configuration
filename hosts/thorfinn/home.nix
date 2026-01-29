{ config, pkgs, ... }:

{
  home.username = "cedev";
  home.homeDirectory = "/home/cedev";
  home.stateVersion = "25.05";
 
  nixpkgs.config.allowUnfree = true;

  home.file.".p10k.zsh".source = ../../dotfiles/p10k.zsh;

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

  imports = [
  	../../modules/waybar/default.nix
 	../../modules/hyprland/default.nix
  ../../modules/ranger/default.nix
  ../../modules/kitty/default.nix
  ../../modules/rofi/default.nix
  ../../modules/zsh/default.nix
  ];

  hyprland.isDualMonitor = false;
  waybar.isLaptop = true;
}
