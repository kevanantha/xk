{ inputs, pkgs, ... }:

{
  # environment.systemPackages = [ pkgs.nixfmt-rfc-style ];

  # add more system settings here
  nixpkgs.config = {
    allowUnfree = true;
  };
  nixpkgs.overlays = [
    (_: prev: {
      # https://github.com/LnL7/nix-darwin/issues/1041
      inherit (inputs.nixpkgs-stable.legacyPackages.${prev.system}) karabiner-elements;
    })
  ];

  nix = {
    settings = {
      auto-optimise-store = true;
      builders-use-substitutes = true;
      experimental-features = [
        "flakes"
        "nix-command"
      ];
      substituters = [ "https://nix-community.cachix.org" ];
      trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];
      trusted-users = [ "@wheel" ];
      warn-dirty = false;

      # Recommended when using `direnv` etc.
      keep-derivations = true;
      keep-outputs = true;
    };
    gc = {
      automatic = true;
      options = "--delete-older-than 30d";
    };
  };

  programs.zsh.enable = true;

  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      cleanup = "zap";
    };
    brews = [ ];
    casks = [
      "1password"

      "arc"
      "amie"

      "brave-browser"

      # "chatgpt"
      "cleanshot"
      "cloudflare-warp"
      "cursor"

      "displaylink"

      "figma"

      "jordanbaird-ice" # menubar

      "karabiner-elements"

      "marta"

      "orbstack" # for docker desktop

      "pritunl"

      "raycast"

      "superlist"
      "steam"

      "todoist"

      "whatsapp"

      "yaak"

      "zed"
    ];

    taps = [
      # "koekeishiya/formulae" # yabai
      # "cmacrae/formulae" # spacebar
    ];

    # These app IDs are from using the mas CLI app
    # mas stands for "mac app store"
    # https://github.com/mas-cli/mas
    #
    # $ nix shell nixpkgs#mas
    # $ mas search <app name>
    #
    masApps = {
      # "Xcode" = 497799835;
      # "Session" = 1521432881;
      # "Klack" = 2143728525; => install manually due to paid app
      # "hidden-bar" = 1452453066;
    };
  };

  services = {
    jankyborders = {
      enable = true;
      width = 6.5;
      hidpi = false;
      active_color = "0xfffeeff0";
      inactive_color = "0xc02c2e34";
      background_color = "0x302c2e34";
      style = "round";
    };

    karabiner-elements = {
      enable = false; # Installed via homebrew.
    };

    sketchybar = {
      enable = false;
      # package = pkgs.sketchybar;
      config = ''
        sketchybar --bar position=top height=40 blur_radius=30 color=0x40000000
        sketchybar --add item chevron left \
                   --set chevron icon= label.drawing=off \
                   --add item front_app left \
                   --set front_app icon.drawing=off script="$PLUGIN_DIR/front_app.sh" \
                   --subscribe front_app front_app_switched

        sketchybar --update
      '';
      extraPackages = with pkgs; [
        jq
        sketchybar-app-font
      ];
    };

    skhd = {
      enable = true;
      package = pkgs.skhd;
      skhdConfig = ''
        # Navigation via `hjkl`
        alt - 0x04 : yabai -m window --focus west
        alt - 0x26 : yabai -m window --focus south
        alt - 0x28 : yabai -m window --focus north
        alt - 0x25 : yabai -m window --focus east

        # Moving windows
        shift + alt - h : yabai -m window --warp west
        shift + alt - j : yabai -m window --warp south
        shift + alt - k : yabai -m window --warp north
        shift + alt - l : yabai -m window --warp east

        # Move focus container to workspace
        shift + alt - m : yabai -m window --space last; yabai -m space --focus last
        shift + alt - p : yabai -m window --space prev; yabai -m space --focus prev
        shift + alt - n : yabai -m window --space next; yabai -m space --focus next
        shift + alt - 1 : yabai -m window --space 1; yabai -m space --focus 1
        shift + alt - 2 : yabai -m window --space 2; yabai -m space --focus 2
        shift + alt - 3 : yabai -m window --space 3; yabai -m space --focus 3
        shift + alt - 4 : yabai -m window --space 4; yabai -m space --focus 4

        # Resize windows
        lctrl + alt - h : yabai -m window --resize left:-50:0; \
                          yabai -m window --resize right:-50:0
        lctrl + alt - j : yabai -m window --resize bottom:0:50; \
                          yabai -m window --resize top:0:50
        lctrl + alt - k : yabai -m window --resize top:0:-50; \
                          yabai -m window --resize bottom:0:-50
        lctrl + alt - l : yabai -m window --resize right:50:0; \
                          yabai -m window --resize left:50:0

        # Equalize size of windows
        lctrl + alt - e : yabai -m space --balance

        # Enable / Disable gaps in current workspace
        lctrl + alt - g : yabai -m space --toggle padding; yabai -m space --toggle gap

        # Rotate windows clockwise and anticlockwise
        alt - r         : yabai -m space --rotate 270
        shift + alt - r : yabai -m space --rotate 90

        # Rotate on X and Y Axis
        shift + alt - x : yabai -m space --mirror x-axis
        shift + alt - y : yabai -m space --mirror y-axis

        # Set insertion point for focused container
        shift + lctrl + alt - h : yabai -m window --insert west
        shift + lctrl + alt - j : yabai -m window --insert south
        shift + lctrl + alt - k : yabai -m window --insert north
        shift + lctrl + alt - l : yabai -m window --insert east

        # Float / Unfloat window
        shift + alt - space : \
            yabai -m window --toggle float; \
            yabai -m window --toggle border

        # Make window native fullscreen
        alt - f         : yabai -m window --toggle zoom-fullscreen
        shift + alt - f : yabai -m window --toggle native-fullscreen
      '';
    };

    spacebar = {
      enable = false;
      package = pkgs.spacebar;
      config = {
        position = "top";
        display = "main";
        height = 26;
        title = "on";
        spaces = "on";
        clock = "on";
        power = "on";
        padding_left = 20;
        padding_right = 20;
        spacing_left = 25;
        spacing_right = 15;
        text_font = ''"Menlo:Regular:12.0"'';
        icon_font = ''"Font Awesome 5 Free:Solid:12.0"'';
        background_color = "0xff202020";
        foreground_color = "0xffa8a8a8";
        power_icon_color = "0xffcd950c";
        battery_icon_color = "0xffd75f5f";
        dnd_icon_color = "0xffa8a8a8";
        clock_icon_color = "0xffa8a8a8";
        power_icon_strip = " ";
        space_icon = "•";
        space_icon_strip = "1 2 3 4 5 6 7 8 9 10";
        spaces_for_all_displays = "on";
        display_separator = "on";
        display_separator_icon = "";
        space_icon_color = "0xff458588";
        space_icon_color_secondary = "0xff78c4d4";
        space_icon_color_tertiary = "0xfffff9b0";
        clock_icon = "";
        dnd_icon = "";
        clock_format = ''"%d/%m/%y %R"'';
        right_shell = "on";
        right_shell_icon = "";
        right_shell_command = "whoami";
      };
    };

    yabai = {
      enable = true;
      package = pkgs.yabai;
      config = {
        focus_follows_mouse = "off";
        mouse_follows_focus = "off";
        window_origin_display = "default";
        window_placement = "second_child";
        window_shadow = "on";
        window_opacity = "off";
        window_animation_duration = 0.0;
        window_animation_frame_rate = 120;
        window_opacity_duration = 0.0;
        active_window_opacity = 1.0;
        normal_window_opacity = 0.9;
        active_window_border_color = "0xE0808080";
        normal_window_border_color = "0x00010101";
        insert_feedback_color = "0xE02d74da";
        split_ratio = 0.5;
        split_type = "auto";
        auto_balance = "on";
        top_padding = 10;
        bottom_padding = 10;
        left_padding = 10;
        right_padding = 10;
        window_gap = 10;
        layout = "bsp";
        # external_bar = "all"
      };
      extraConfig = ''
        yabai -m rule --add app='System Preferences' manage=off
        yabai -m rule --add app="^System Settings$" manage=off
        yabai -m rule --add app="^1Password$" manage=off
        yabai -m rule --add app="^Finder$" manage=off
        yabai -m rule --add app="^Karabiner-Elements$" manage=off
        yabai -m rule --add app="^Karabiner-EventViewer$" manage=off
        yabai -m rule --add app="^Activity Monitor$" manage=off
        yabai -m rule --add app="^Spotify$" manage=off
        yabai -m rule --add app="^App Store$" manage=off
        yabai -m rule --add app="^About This Mac$" manage=off
        yabai -m rule --add app="^CleanShot X$" manage=off
        yabai -m rule --add app="^Ice$" manage=off
        yabai -m rule --add app="^Raycast$" manage=off
        yabai -m rule --add app="^WhatsApp$" manage=off
        yabai -m rule --add app="^Marta$" manage=off
        yabai -m rule --add app="^Pritunl$" manage=off
        yabai -m rule --add app="^Pritunl Client$" manage=off
      '';
    };
  };

  system.activationScripts.postActivation.text = ''
    su - $(logname) -c '${pkgs.skhd}/bin/skhd -r'
  '';

  system = {
    stateVersion = 5;
    defaults = {
      dock = {
        autohide = true;
        expose-group-by-app = false;
        minimize-to-application = false;
        mru-spaces = false; # Whether to automatically rearrange spaces based on most recent use.
        orientation = "bottom";
        showhidden = true;
        magnification = true;
        largesize = 100; # default is 16
        mineffect = "genie";
        # Disable all hot corners
        wvous-bl-corner = 1;
        wvous-br-corner = 1;
        wvous-tl-corner = 1;
        wvous-tr-corner = 1;
      };
      finder = {
        AppleShowAllExtensions = true;
        QuitMenuItem = true;
      };
      loginwindow = {
        GuestEnabled = false;
        DisableConsoleAccess = true;
      };
      menuExtraClock = {
        Show24Hour = true;
        ShowDate = 1; # Always
        ShowDayOfMonth = true;
        ShowDayOfWeek = true;
        ShowSeconds = false;
      };
      NSGlobalDomain = {
        AppleKeyboardUIMode = 3;
        NSAutomaticCapitalizationEnabled = false;
        NSAutomaticInlinePredictionEnabled = false;
        NSAutomaticSpellingCorrectionEnabled = false;
        _HIHideMenuBar = null;
        "com.apple.keyboard.fnState" = true;
      };
      trackpad = {
        ActuationStrength = 1;
        TrackpadThreeFingerDrag = false;
      };
      WindowManager = {
        EnableStandardClickToShowDesktop = true;
      };
    };
    keyboard = {
      enableKeyMapping = true;
      remapCapsLockToEscape = true;
    };
  };

  security = {
    pam = {
      enableSudoTouchIdAuth = true;
    };
  };
}
