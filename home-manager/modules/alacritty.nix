{ pkgs, ... }:

{
  programs.alacritty = with pkgs; {
    enable = true;
    package = alacritty;
    settings = {
      env = {
        TERM = "xterm-256color";
      };
      cursor = {
        blink_interval = 400;
        style = {
          shape = "Block";
          blinking = "Always";
        };
      };
      window = {
        opacity = 1;
        position = {
          x = 0;
          y = 0;
        };
        padding = {
          x = 4;
          y = 4;
        };
        dynamic_title = true;
        dynamic_padding = true;
        startup_mode = "Maximized";
        title = "Alacritty";
        decorations = "buttonless";
      };
      font = {
        normal = {
          family = "CommitMono Nerd Font";
        };
        bold = {
          family = "CommitMono Nerd Font";
          style = "Bold";
        };
        italic = {
          family = "CommitMono Nerd Font";
          style = "Italic";
        };
        size = 12.0;
        offset = {
          x = 0;
          y = 2;
        };
      };
    };
  };
}
