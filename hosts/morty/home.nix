{ config, pkgs, ... }:

{
  home.username = "cedev";
  home.homeDirectory = "/home/cedev";
  home.stateVersion = "25.05";
 
  nixpkgs.config.allowUnfree = true;

  home.file.".p10k.zsh".source = ../../dotfiles/p10k.zsh;

  programs.git = {
    enable = true;
    userName = "cedev-1";
    userEmail = "cedevserver@gmail.com";
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
    
    nodejs_24    
    
    grim
    slurp
    wl-clipboard
    neofetch
    sway
    swaybg

    gpu-screen-recorder-gtk    
    nix-direnv
    direnv
    
    # APP
    google-chrome
    code-cursor
    vscode
    bruno
    discord
    nextcloud-client
    rustdesk
  ];

  imports = [
  ../../modules/waybar/default.nix
 	../../modules/hyprland/default.nix
  ../../modules/ranger/default.nix
  ../../modules/kitty/default.nix
  ../../modules/rofi/default.nix
  ];

  hyprland.isDualMonitor = true;
}
