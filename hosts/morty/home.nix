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

  programs.zsh = {
  enable = true;
  autosuggestion.enable = true;
  syntaxHighlighting.enable = true;
  oh-my-zsh.enable = false;

  initContent = ''
      source /nix/store/*powerlevel10k*/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
      [[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
    ''; 
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
    wget
    btop
    git
    pavucontrol
    bluetui

    jellyfin-tui
    

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
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-powerlevel10k
    gh-copilot
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
