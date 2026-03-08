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

  programs.btop = {
    enable = true;
    settings = {
      # color_theme = "matcha-dark-sea";
      color_theme = "TTY";
      theme_background = false;
      truecolor = true;
    };
  };

  xdg.configFile."btop/btop.conf".force = true;

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
    jq
    openssl

    grim
    slurp
    wl-clipboard
    sway
    swaybg

    gpu-screen-recorder-gtk
    nix-direnv
    direnv

    # APP
    obsidian
    google-chrome
    vscode
    bruno
    discord
    nextcloud-client
    rustdesk
    opencode
    claude-code
  ];

  imports = [
  ../../modules/waybar/default.nix
 	../../modules/hyprland/default.nix
  ../../modules/ranger/default.nix
  ../../modules/kitty/default.nix
  ../../modules/rofi/default.nix
  ../../modules/zed/default.nix
  ../../modules/zsh/default.nix
  ];

  hyprland.isDualMonitor = true;
}
