{ pkgs, ... }:

let
  delta = "${pkgs.delta}/bin/delta";

  git_checkout_fzf_script = pkgs.writeScript "git-ch.bash" ''
    #!${pkgs.bash}/bin/bash
    if test "$#" -ne 0; then
      if [[ "$*" = "master" ]] || [[ "$*" = "main" ]]; then
        git checkout "$(git branch --format '%(refname:short)' --sort=-committerdate --list master main | head -n1)"
      else
        git checkout "$@"
      fi
    else
      git branch -a --format="%(refname:short)" | sed 's|origin/||g' | grep -v "HEAD" | grep -v "origin" | sort | uniq | ${pkgs.fzf}/bin/fzf | xargs git checkout
    fi
  '';

  me = {
    name = "Kevin Anantha (kevan)";
    email = "kevin.anantha@gmail.com";
    signingKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBdr3xzltKq4zOXOS0f/EW2T2QfVi4DFk5ocIJ3WgXOH";
  };

  mekari = {
    name = "Kevin Anantha (kevan)";
    email = "kevin.anantha@mekari.com";
    signingKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFQTDvspAGcXV+ebrdzHPlrw+Lrnf+TEVxbzAktZv9rs";
  };

  efishery = {
    name = "kevan (kevin anantha)";
    email = "kevin.anantha@efishery.com";
    signingKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFgoKUrSlUcDowPKEDOvxMluhdRGNvVQC+WPyjoNwYTL";
  };
in
{
  programs.git = {
    enable = true;
    ignores = [
      ".direnv/"
      "*.swp"
      ".DS_Store"
    ];
    aliases = {
      ch = "!${git_checkout_fzf_script}";
      copy-branch = "!git branch --show-current | pbcopy";
    };
    extraConfig = {
      user = {
        name = "${me.name}";
        email = "${me.email}";
        signingKey = "${me.signingKey}";
      };
      gpg = {
        format = "ssh";
      };
      "gpg \"ssh\"" = {
        # 1password GUI installed via homebrew
        program = "/Applications/1Password.app/Contents/MacOS/op-ssh-sign";
      };
      commit = {
        gpgsign = true;
      };
      pull = {
        rebase = true;
      };
      push = {
        autoSetupRemote = true;
      };
      core = {
        editor = "nvim";
        autocrlf = false;
        pager = delta;
        fsmonitor = true;
        untrackedcache = true;
      };
      interactive = {
        diffFilter = "${delta} --color-only";
      };
      init = {
        defaultBranch = "main";
      };
      fetch = {
        prune = true;
      };
      checkout = {
        defaultRemote = "origin";
      };
      url = {
        "git@bitbucket.org:" = {
          insteadOf = "https://bitbucket.org/";
        };
        "git@gitlab.com:" = {
          insteadOf = "https://gitlab.com/";
        };
      };
      color = {
        ui = true;
        "diff-highlight" = {
          oldNormal = "red bold";
          oldHighlight = "red bold 52";
          newNormal = "green bold";
          newHighlight = "green bold 22";
        };
        diff = {
          meta = "11";
          frag = "magenta bold";
          func = "146 bold";
          commit = "yellow bold";
          old = "red bold";
          new = "green bold";
          whitespace = "red reverse";
        };
      };
    };
    delta = {
      enable = true;
      options = {
        line-numbers = true;
        navigate = true;
        side-by-side = true;
        decorations = {
          commit-decoration-style = "bold yellow box ul";
          file-decoration-style = "none";
          file-style = "bold yellow ul";
        };
        features = "decorations";
        whitespace-error-style = "22 reverse";
      };
    };
    includes = [
      {
        condition = "gitdir:~/w/";
        contentSuffix = "gitconfig-mekari";
        contents = {
          user = mekari;
          gpg = {
            format = "ssh";
          };
          "gpg \"ssh\"" = {
            # 1password GUI installed via homebrew
            program = "/Applications/1Password.app/Contents/MacOS/op-ssh-sign";
          };
          commit = {
            gpgsign = true;
          };
          pull = {
            rebase = true;
          };
          push = {
            autoSetupRemote = true;
          };
          core = {
            editor = "nvim";
            autocrlf = false;
            pager = delta;
            fsmonitor = true;
            untrackedcache = true;
          };
          interactive = {
            diffFilter = "${delta} --color-only";
          };
          init = {
            defaultBranch = "main";
          };
          fetch = {
            prune = true;
          };
          checkout = {
            defaultRemote = "origin";
          };
          url = {
            "git@bitbucket.org:" = {
              insteadOf = "https://bitbucket.org/";
            };
            "git@gitlab.com:" = {
              insteadOf = "https://gitlab.com/";
            };
          };
          color = {
            ui = true;
            "diff-highlight" = {
              oldNormal = "red bold";
              oldHighlight = "red bold 52";
              newNormal = "green bold";
              newHighlight = "green bold 22";
            };
            diff = {
              meta = "11";
              frag = "magenta bold";
              func = "146 bold";
              commit = "yellow bold";
              old = "red bold";
              new = "green bold";
              whitespace = "red reverse";
            };
          };
        };
      }
      {
        condition = "gitdir:~/w/";
        contentSuffix = "gitconfig-efishery";
        contents = {
          user = efishery;
          gpg = {
            format = "ssh";
          };
          "gpg \"ssh\"" = {
            # 1password GUI installed via homebrew
            program = "/Applications/1Password.app/Contents/MacOS/op-ssh-sign";
          };
          commit = {
            gpgsign = true;
          };
          pull = {
            rebase = true;
          };
          push = {
            autoSetupRemote = true;
          };
          core = {
            editor = "nvim";
            autocrlf = false;
            pager = delta;
            fsmonitor = true;
            untrackedcache = true;
          };
          interactive = {
            diffFilter = "${delta} --color-only";
          };
          init = {
            defaultBranch = "main";
          };
          fetch = {
            prune = true;
          };
          checkout = {
            defaultRemote = "origin";
          };
          url = {
            "git@bitbucket.org:" = {
              insteadOf = "https://bitbucket.org/";
            };
            "git@gitlab.com:" = {
              insteadOf = "https://gitlab.com/";
            };
          };
          color = {
            ui = true;
            "diff-highlight" = {
              oldNormal = "red bold";
              oldHighlight = "red bold 52";
              newNormal = "green bold";
              newHighlight = "green bold 22";
            };
            diff = {
              meta = "11";
              frag = "magenta bold";
              func = "146 bold";
              commit = "yellow bold";
              old = "red bold";
              new = "green bold";
              whitespace = "red reverse";
            };
          };
        };
      }
    ];
  };
}
