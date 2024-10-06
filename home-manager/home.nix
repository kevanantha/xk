{ pkgs, ... }:

{
  fonts = {
    fontconfig = {
      enable = true;
    };
  };

  home.stateVersion = "24.05";

  # add home-manager user settings here
  home.packages = with pkgs; [
    (nerdfonts.override {
      fonts = [
        "CommitMono"
        "JetBrainsMono"
      ];
    })

    commit-mono # font
    coreutils

    # espanso

    discord
    docker

    httpie

    jetbrains.datagrip
    jetbrains.webstorm
    jq

    neofetch
    ngrok

    obsidian
    openssl

    postman

    slack
    spotify

    tableplus
    teams
    telegram-desktop
    todoist
    tree

    # vscode

    xh # HTTPie-like

    zoom-us
  ];

  programs = {
    atuin = {
      enable = true;
      enableZshIntegration = true;
    };
    bottom = {
      enable = true;
    };
    direnv = {
      enable = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
    };
    fzf = {
      enable = true;
      enableZshIntegration = true;
    };
    gh = {
      enable = true;
      settings = {
        git_protocol = "ssh";
        aliases = { };
      };
    };
    gh-dash = {
      enable = true;
    };
    home-manager = {
      enable = true;
    };
    ripgrep = {
      enable = true;
      arguments = [
        "--max-columns-preview"
        "--colors=line:style:bold"
      ];
    };
    zellij = {
      enable = false;
      enableZshIntegration = true;
      settings = { };
    };
    zoxide = {
      enable = true;
      enableZshIntegration = true;
    };
  };

  imports = [
    ./modules/1password-shell.nix
    ./modules/alacritty.nix
    ./modules/bat.nix
    ./modules/eza.nix
    ./modules/git.nix
    ./modules/nvim
    ./modules/starship.nix
    ./modules/ssh.nix
    ./modules/tmux.nix
    ./modules/zsh.nix
  ];

  xdg = {
    enable = true;
  };
}
