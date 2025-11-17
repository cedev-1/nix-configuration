{ lib, config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    font.name = "JetBrainsMono Nerd Font";
    font.size = 11;
    settings = {
      window_padding_width = 20;
      background_opacity = 0.70;
      confirm_os_window_close = 0;
      allow_remote_control = "yes";

      foreground = "#FFFFFF";
      background = "#2F364A";
      selection_foreground = "#2F364A";
      selection_background = "#FFFFFF";
      cursor = "#E1A2B7";
      cursor_text_color = "#090A0A";

      active_tab_foreground = "#2F364A";
      active_tab_background = "#D9C95E";
      inactive_tab_foreground = "#D9C95E";
      inactive_tab_background = "#2F364A";

      # black
      color0 = "#293352";
      color8 = "#57668F";

      # red
      color1 = "#FFCCDD";
      color9 = "#F0AAC1";

      # green
      color2 = "#CCF5FF";
      color10 = "#AAE2F0";

      # yellow
      color3 = "#FFF8CC";
      color11 = "#F0E7AA";

      # blue
      color4 = "#9AADE6";
      color12 = "#9AADE6";

      # magenta
      color5 = "#9AD7E6";
      color13 = "#9AD7E6";

      # cyan
      color6 = "#E6DC9A";
      color14 = "#E6DC9A";

      # white
      color7 = "#FFCCDD";
      color15 = "#F0AAC1";
    };
  };

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    oh-my-zsh.enable = false;

    shellAliases = {
      k = "kubectl";
      kns = "kubectl get pods -A";
      ls = "eza --icons=auto";
      tree = "eza --icons=auto -T";
      cat = "bat";
      ex = "exit";
      dps = "docker ps";
      dpa = "docker ps -a";

      "..." = "cd ../..";
      ".." = "cd ..";

    };

    initContent = ''
        source /nix/store/*powerlevel10k*/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
        [[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
      '';
  };

  home.packages = with pkgs; [
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-powerlevel10k

    wget
    btop
    git

    bat
    eza
    fzf
    ripgrep

    lazydocker

    ncdu

    opentofu
    kubernetes-helm
    kubectl
    kind
    k9s

    jellyfin-tui
  ];
}
