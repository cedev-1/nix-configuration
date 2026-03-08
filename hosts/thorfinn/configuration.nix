{ config, pkgs, lib, clevo-xsm-wmi-pkg, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

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

  services.xserver.enable = true;
  services.desktopManager.plasma6.enable = false;
  
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.displayManager.defaultSession = "hyprland";

  environment.systemPackages = with pkgs; [
    qt6.qtbase
    qt6.qtdeclarative
    qt6.qtsvg
    qt6.qt5compat
    qt6.qtwayland
    qt6.qtquick3d

    brightnessctl
    playerctl
    pamixer
    libinput
  ];

  services.libinput = {
    enable = true;
  };

  services.xserver.xkb.layout = "fr";
  console.keyMap = "fr";

  services.printing.enable = true;

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  services.upower = {
    enable = true;
  };

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        Enable = "Source,Sink,Media,Socket";
      };
    };
  };

  hardware.tuxedo-drivers.enable = true;

  boot.extraModulePackages = [ 
    config.boot.kernelPackages.tuxedo-keyboard 
    clevo-xsm-wmi-pkg
  ];
  boot.kernelModules = [ "clevo-xsm-wmi" "tuxedo_keyboard" "i2c-dev" "i2c-i801" "i2c-piix4" ];

  services.udev.packages = [ pkgs.openrgb ];
  services.udev.extraRules = ''
    SUBSYSTEM=="leds", KERNEL=="rgb:kbd_backlight", OWNER="root", GROUP="input", MODE="0664", TAG+="uaccess"
  '';

  systemd.services.keyboard-rgb = {
    description = "Keyboard RGB permissions and defaults";
    wantedBy = [ "multi-user.target" ];
    after = [ "systemd-modules-load.service" ];
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
      ExecStart = "${pkgs.bash}/bin/bash -c 'sleep 2; chmod 666 /sys/class/leds/rgb:kbd_backlight/brightness 2>/dev/null; chmod 666 /sys/class/leds/rgb:kbd_backlight/multi_intensity 2>/dev/null; echo 100 > /sys/class/leds/rgb:kbd_backlight/brightness 2>/dev/null; echo 255 0 255 > /sys/class/leds/rgb:kbd_backlight/multi_intensity 2>/dev/null'";
    };
  };

  hardware.i2c.enable = true;

  services.blueman.enable = true;
  
  users.users.cedev = {
    isNormalUser = true;
    description = "cedev";
    extraGroups = [ "networkmanager" "wheel" "docker" "input" "i2c" ];
    shell = pkgs.zsh;
  };

  programs.zsh.enable = true;
  programs.hyprland.enable = true;

  programs.firefox.enable = true;

  virtualisation.docker.enable = true;

  nixpkgs.config.allowUnfree = true;
  
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  system.stateVersion = "25.05";

  environment.sessionVariables = {
    TERMINAL = "kitty";
  };
}
