{ lib, ... }:

{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      # The default format https://starship.rs/config/#prompt
      format = lib.concatStrings [
        "$username"
        "$hostname"
        "$directory"
        "\${custom.git_server_icon} "
        "$all"
      ];
      palette = "catppuccin_mocha";
      palettes.catppuccin_mocha = {
        rosewater = "#f5e0dc";
        flamingo = "#f2cdcd";
        pink = "#f5c2e7";
        mauve = "#cba6f7";
        red = "#f38ba8";
        maroon = "#eba0ac";
        peach = "#fab387";
        yellow = "#f9e2af";
        green = "#a6e3a1";
        teal = "#94e2d5";
        sky = "#89dceb";
        sapphire = "#74c7ec";
        blue = "#89b4fa";
        lavender = "#b4befe";
        text = "#cdd6f4";
        subtext1 = "#bac2de";
        subtext0 = "#a6adc8";
        overlay2 = "#9399b2";
        overlay1 = "#7f849c";
        overlay0 = "#6c7086";
        surface2 = "#585b70";
        surface1 = "#45475a";
        surface0 = "#313244";
        base = "#1e1e2e";
        mantle = "#181825";
        crust = "#11111b";
      };
      add_newline = true;
      command_timeout = 1000;
      cmd_duration = {
        format = " [$duration]($style) ";
        style = "bold #EC7279";
        show_notifications = true;
      };
      right_format = "$cmd_duration";
      battery = {
        full_symbol = "🔋 ";
        charging_symbol = "⚡️ ";
        discharging_symbol = "💀 ";
      };
      git_branch = {
        format = "[$symbol$branch]($style) ";
      };
      character = {
        success_symbol = "[λ](bold green)";
        error_symbol = "[λ](bold red)";
        vimcmd_symbol = "[λ](bold green)";
      };

      custom = {
        git_server_icon = {
          description =
            "Show a GitHub, GitLab, or Bitbucket icon depending on current git remote";
          when = "git rev-parse --is-inside-work-tree 2> /dev/null";
          command = ''
            GIT_REMOTE=$(git ls-remote --get-url 2> /dev/null);
            if [[ "$GIT_REMOTE" =~ "github" ]]; then
              printf "\e[1;37m\e[0m"; # GitHub icon in white
            elif [[ "$GIT_REMOTE" =~ "gitlab" ]]; then
              echo ""; # GitLab icon
              STYLE="bold #E04229"; # GitLab brand color
            elif [[ "$GIT_REMOTE" =~ "bitbucket" ]]; then
              echo ""; # Bitbucket icon
              STYLE="bold #0053CD"; # Bitbucket brand color
            else
              echo "󰊢"; # Default icon
              STYLE="bold #F16247"; # Default style color
            fi
          '';
          shell = [ "bash" "--noprofile" "--norc" ];
          style = "$STYLE";
          format = "[$output]($style) ";
        };
      };

      aws = {
        symbol = "  ";
      };

      buf = {
        symbol = " ";
      };

      c = {
        symbol = " ";
      };

      conda = {
        symbol = " ";
      };

      crystal = {
        symbol = " ";
      };

      dart = {
        symbol = " ";
      };

      directory = {
        read_only = " 󰌾";
      };

      direnv = {
        disabled = false;
        symbol = " direnv ";
        style = "bold #89B4FA";
        format = "[$symbol$loaded/$allowed]($style) ";
      };

      docker_context = {
        symbol = " ";
      };

      elixir = {
        symbol = " ";
      };

      elm = {
        symbol = " ";
      };

      fennel = {
        symbol = " ";
      };

      fossil_branch = {
        symbol = " ";
      };

      git_branch = {
        symbol = " ";
      };

      golang = {
        symbol = " ";
      };

      guix_shell = {
        symbol = " ";
      };

      haskell = {
        symbol = " ";
      };

      haxe = {
        symbol = " ";
      };

      hg_branch = {
        symbol = " ";
      };

      hostname = {
        ssh_symbol = " ";
      };

      java = {
        symbol = " ";
      };

      julia = {
        symbol = " ";
      };

      kotlin = {
        symbol = " ";
      };

      lua = {
        symbol = " ";
      };

      memory_usage = {
        symbol = "󰍛 ";
      };

      meson = {
        symbol = "󰔷 ";
      };

      nim = {
        symbol = "󰆥 ";
      };

      nix_shell = {
        symbol = " ";
        impure_msg = "[impure](bold #89B4FA)";
        pure_msg = "[pure](bold green)";
        unknown_msg = "[unknown](bold yellow)";
        format = "via [$symbol$state( \($name\))](bold blue) ";
      };

      nodejs = {
        symbol = " ";
      };

      ocaml = {
        symbol = " ";
      };

      os = {
        symbols = {
          Alpaquita = " ";
          Alpine = " ";
          AlmaLinux = " ";
          Amazon = " ";
          Android = " ";
          Arch = " ";
          Artix = " ";
          CentOS = " ";
          Debian = " ";
          DragonFly = " ";
          Emscripten = " ";
          EndeavourOS = " ";
          Fedora = " ";
          FreeBSD = " ";
          Garuda = "󰛓 ";
          Gentoo = " ";
          HardenedBSD = "󰞌 ";
          Illumos = "󰈸 ";
          Kali = " ";
          Linux = " ";
          Mabox = " ";
          Macos = " ";
          Manjaro = " ";
          Mariner = " ";
          MidnightBSD = " ";
          Mint = " ";
          NetBSD = " ";
          NixOS = " ";
          OpenBSD = "󰈺 ";
          openSUSE = " ";
          OracleLinux = "󰌷 ";
          Pop = " ";
          Raspbian = " ";
          Redhat = " ";
          RedHatEnterprise = " ";
          RockyLinux = " ";
          Redox = "󰀘 ";
          Solus = "󰠳 ";
          SUSE = " ";
          Ubuntu = " ";
          Unknown = " ";
          Void = " ";
          Windows = "󰍲 ";
        };
      };

      package = {
        symbol = "󰏗 ";
      };

      perl = {
        symbol = " ";
      };

      php = {
        symbol = " ";
      };

      pijul_channel = {
        symbol = " ";
      };

      python = {
        symbol = " ";
      };

      rlang = {
        symbol = "󰟔 ";
      };

      ruby = {
        symbol = " ";
      };

      rust = {
        symbol = "󱘗 ";
      };

      scala = {
        symbol = " ";
      };

      swift = {
        symbol = " ";
      };

      username = {
        disabled = false;
        show_always = true;
      };

      zig = {
        symbol = " ";
      };
    };
  };
}
