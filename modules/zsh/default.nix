{ config, lib, pkgs, ... }:

{
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

    initContent = lib.mkBefore ''
      source /nix/store/*powerlevel10k*/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
      [[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
    '';
  };

  home.packages = with pkgs; [
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-powerlevel10k

    # Terminal utilities
    wget
    btop
    git
    sops
    age

    bat
    eza
    fzf
    ripgrep

    lazydocker
    ncdu

    # DevOps tools
    opentofu
    kubernetes-helm
    kubectl
    kind
    k9s

    # Media
    jellyfin-tui
  ];
}