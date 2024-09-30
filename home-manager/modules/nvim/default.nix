{ inputs, pkgs, ... }:

{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./settings.nix
  ];

  programs.nixvim = {
    enable = true;

    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };

    clipboard = {
      # Use system clipboard
      register = "unnamedplus";
    };

    colorschemes = {
      kanagawa = {
        enable = true;
      };
    };

    # opts = {
    #   number = true;
    #   relativenumber = true;
    #   shiftwidth = 2;
    #   mouse = "a";
    #   mousemodel = "extend";
    # };

    plugins = {
      alpha = {
        enable = true;
        layout = [
          {
            type = "padding";
            val = 2;
          }
          {
            opts = {
              hl = "Type";
              position = "center";
            };
            type = "text";
            val = [
              "███╗   ██╗██╗██╗  ██╗██╗   ██╗██╗███╗   ███╗"
              "████╗  ██║██║╚██╗██╔╝██║   ██║██║████╗ ████║"
              "██╔██╗ ██║██║ ╚███╔╝ ██║   ██║██║██╔████╔██║"
              "██║╚██╗██║██║ ██╔██╗ ╚██╗ ██╔╝██║██║╚██╔╝██║"
              "██║ ╚████║██║██╔╝ ██╗ ╚████╔╝ ██║██║ ╚═╝ ██║"
              "╚═╝  ╚═══╝╚═╝╚═╝  ╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝"
            ];
          }
          {
            type = "padding";
            val = 2;
          }
          {
            type = "group";
            val = [
              {
                on_press = {
                  __raw = "function() vim.cmd[[ene]] end";
                };
                opts = {
                  shortcut = "n";
                };
                type = "button";
                val = "  New file";
              }
              {
                on_press = {
                  __raw = "function() vim.cmd[[qa]] end";
                };
                opts = {
                  shortcut = "q";
                };
                type = "button";
                val = " Quit Neovim";
              }
            ];
          }
          {
            type = "padding";
            val = 2;
          }
          {
            opts = {
              hl = "Keyword";
              position = "center";
            };
            type = "text";
            val = "Inspiring quote here.";
          }
        ];
      };
      bufferline = {
        enable = true;
      };
      comment = {
        enable = true;
      };
      direnv = {
        enable = true;
      };
      dressing = {
        enable = true;
        settings = {
          input = {
            enabled = true;
            mappings = {
              i = {
                "<C-c>" = "Close";
                "<CR>" = "Confirm";
                "<Down>" = "HistoryNext";
                "<Up>" = "HistoryPrev";
              };
              n = {
                "<CR>" = "Confirm";
                "<Esc>" = "Close";
              };
            };
          };
          select = {
            backend = [
              "telescope"
              "fzf_lua"
              "fzf"
              "builtin"
              "nui"
            ];
            builtin = {
              mappings = {
                "<C-c>" = "Close";
                "<CR>" = "Confirm";
                "<Esc>" = "Close";
              };
            };
            enabled = true;
          };
        };
      };
      friendly-snippets = {
        enable = true;
      };
      gitsigns = {
        enable = true;
        settings = {
          current_line_blame = false;
          current_line_blame_opts = {
            virt_text = true;
            virt_text_pos = "eol";
          };
          signcolumn = true;
          signs = {
            add = {
              text = "│";
            };
            change = {
              text = "│";
            };
            changedelete = {
              text = "~";
            };
            delete = {
              text = "_";
            };
            topdelete = {
              text = "‾";
            };
            untracked = {
              text = "┆";
            };
          };
          watch_gitdir = {
            follow_files = true;
          };
        };
      };
      indent-blankline = {
        enable = true;
        settings = {
          exclude = {
            buftypes = [
              "terminal"
              "quickfix"
            ];
            filetypes = [
              ""
              "checkhealth"
              "help"
              "lspinfo"
              "packer"
              "TelescopePrompt"
              "TelescopeResults"
              "yaml"
            ];
          };
          indent = {
            char = "│";
          };
          scope = {
            show_end = false;
            show_exact_scope = true;
            show_start = false;
          };
        };
      };
      lualine = {
        enable = true;
      };
      neo-tree = {
        enable = true;
        enableDiagnostics = true;
        enableGitStatus = true;
        closeIfLastWindow = true;
        window = {
          width = 30;
          autoExpandWidth = true;
        };
      };
      neoscroll = {
        enable = true;
        settings = {
          cursor_scrolls_alone = true;
          easing_function = "quadratic";
          hide_cursor = true;
          mappings = [
            "<C-u>"
            "<C-d>"
            "<C-b>"
            "<C-f>"
            "<C-y>"
            "<C-e>"
            "zt"
            "zz"
            "zb"
          ];
          respect_scrolloff = false;
          stop_eof = true;
        };
      };
      sleuth = {
        enable = true;

      };
      telescope = {
        enable = true;
      };
      tmux-navigator = {
        enable = true;
      };
      trouble = {
        enable = true;
      };
      # wakatime = {
      #  enable = true;
      # };
      which-key = {
        enable = true;
      };
    };

    keymaps = [
      {
        mode = "n";
        key = "<leader>e";
        action = ":Neotree action=focus reveal toggle<CR>";
        options.silent = true;
      }
    ];
  };
}
