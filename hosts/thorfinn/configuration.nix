{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "cedev-laptop";
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Paris";

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "fr_FR.UTF-8";
    LC_IDENTIFICATION = "fr_FR.UTF-8";
    LC_MEASUREMENT = "fr_FR.UTF-8";
    LC_MONETARY = "fr_FR.UTF-8";
    LC_NAME = "fr_FR.UTF-8";
    LC_NUMERIC = "fr_FR.UTF-8";
    LC_PAPER = "fr_FR.UTF-8";
    LC_TELEPHONE = "fr_FR.UTF-8";
    LC_TIME = "fr_FR.UTF-8";
  };

  # X11 & SSDM + Hyprland
  services.xserver.enable = true;
  services.desktopManager.plasma6.enable = false;
  
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.displayManager.lightdm.background = ../../modules/backgrounds/wall.png;
  services.xserver.displayManager.lightdm.greeters.gtk = {
    theme.name = "Adwaita-dark";
    indicators = [];
    extraConfig = ''
      show-clock = false
      show-indicators = 
      hide-user-image = true
    '';
  };

  environment.systemPackages = with pkgs; [
    qt6.qtbase
    qt6.qtdeclarative
    qt6.qtsvg
    qt6.qt5compat
    qt6.qtwayland
    qt6.qtquick3d
  ];

  services.xserver.xkb.layout = "fr";
  console.keyMap = "fr";

  # Impression
  services.printing.enable = true;

  # Pipewire
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # BLUETOOTH - À AJOUTER
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        Enable = "Source,Sink,Media,Socket";
      };
    };
  };

  services.blueman.enable = true;
  
  # Utilisateur
  users.users.cedev = {
    isNormalUser = true;
    description = "cedev";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    shell = pkgs.zsh;
  };

  # Programmes système
  programs.zsh.enable = true;
  programs.hyprland.enable = true;
  programs.firefox.enable = true;

  # Docker
  virtualisation.docker.enable = true;

  # Autoriser les paquets non-libres
  nixpkgs.config.allowUnfree = true;

  # Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  system.stateVersion = "25.05";

  environment.sessionVariables = {
    TERMINAL = "kitty";
  };
}
