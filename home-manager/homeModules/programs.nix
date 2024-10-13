{ ... }:

{
  programs = {
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };

    kitty = {
      enable = true;
      settings = {
        font_family = "Hasklug Nerd Font";
        bold_font = "auto";
        italic_font = "auto";
        bold_italic_font = "auto";

        font_size = 11;
        force_ltr = "no";
        disable_ligatures = "never";
        font_features = "HasklugNF +calt";

        cursor = "#FFAEAE";
        cursor_text_color = "#1F1E33";
        cursor_shape = "underline";

        cursor_stop_blinking_after = 0;

        enable_audio_bell = "no";
        hide_window_decorations = "yes";
        remember_window_size = "yes";
        initial_window_width = 1366;
        initial_window_height = 768;

        tab_bar_edge = "top";
        tab_bar_style = "separator";
        tab_bar_min_tabs = 2;
        tab_separator = ''\::\'';
        tab_title_template = "\"{index} -> {title} \"";
        tab_title_max_length = 0;

        background_blur = 0;
        background_opacity = 1;
        dynamic_background_opacity = "yes";
        background_image_layout = "cscaled";
        background_image_linear = "yes";
        selection_background = "#4C566A";
        selection_foreground = "#FFAEAE";

        color0  = "#444444";
        color8  = "#888888";
        color1  = "#FFFFAA";
        color9  = "#ffffd8";
        color2  = "#FFAEAE";
        color10 = "#FFDFDF";
        color3  = "#C7BBDC";
        color11 = "#dbcdf2";
        color4  = "#B562B8";
        color12 = "#e179e5";
        color5  = "#AA91E1";
        color13 = "#bc9ff9";
        color6  = "#6348D5";
        color14 = "#7556ff";
        color7  = "#AAAEEE";
        color15 = "#CCCCFF";

        shell = ".";
        editor = "nvim";
        shell_integration = "enabled";
        allow_cloning = "ask";
        notify_on_cmd_finish = "unfocused";
      };
      shellIntegration.enableZshIntegration = true;
      font.name = "Hasklug Nerd Font";
      font.size = 11;
    };

    tmux = {
      enable = true;
      prefix = "M-Space";
      clock24 = true;
      extraConfig = ''
        ${builtins.readFile ./conf/tmux.conf}
      '';
    };

    ranger = {
      enable = true;
      extraConfig = ''
        set show_hidden true
      '';
    };

    lf = {
      enable = true;
      extraConfig = builtins.readFile ./conf/lfrc;
    };
  };
}
