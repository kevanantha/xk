{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    initExtra = ''
      'eval $(op signin)'
    '';
    autosuggestion = {
      enable = true;
    };
    enableCompletion = true;
    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "wd"
      ];
    };
    plugins = [
      {
        # will source zsh-autosuggestions.plugin.zsh
        name = "zsh-autosuggestions";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-autosuggestions";
          rev = "a411ef3e0992d4839f0732ebeb9823024afaaaa8";
          sha256 = "KLUYpUu4DHRumQZ3w59m9aTW6TBKMCXl2UcKi4uMd7w=";
        };
      }
      {
        # will source zsh-syntax-highlighting.plugin.zsh
        name = "zsh-syntax-highlighting";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-syntax-highlighting";
          rev = "754cefe0181a7acd42fdcb357a67d0217291ac47";
          sha256 = "kWgPe7QJljERzcv4bYbHteNJIxCehaTu4xU9r64gUM4=";
        };
      }
    ];
    shellAliases = {
      c = "clear";
      v = "nvim"; # nixvim
      vv = "NVIM_APPNAME=lazy_vim nvim"; # lazy_vim
      nd = "nix develop";
      drc = "darwin-rebuild check --flake '.#aarch64'";
      drs = "darwin-rebuild switch --flake '.#aarch64'";
      drcm = "darwin-rebuild check --flake '.#MEKARIs-MacBook-Pro'";
      drsm = "darwin-rebuild switch --flake '.#MEKARIs-MacBook-Pro'";
      tks = "tmux kill-session";
      cat = "bat";
      top = "btm";
      getnodeflake = "curl -LJO https://gist.githubusercontent.com/kevanantha/fb088a5f094108f547200455f3b95a46/raw/98cd243c8d26786a1827c3df0a3e2d0bf19e8fcf/flake.nix ";
      node-shell = "nix shell nixpkgs#nodejs nixpkgs#pnpm nixpkgs#yarn nixpkgs#bun";
    };
  };
}
