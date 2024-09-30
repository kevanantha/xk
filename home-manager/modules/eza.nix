{ ... }:

{
  programs.eza = {
    enable = true;
    enableZshIntegration = true;
    git = true;
    icons = true;
    extraOptions = [
      "--long"
      "--header"
      "--classify"
      "--color=always"
    ];
  };
}
