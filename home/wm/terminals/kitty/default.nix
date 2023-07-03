_: {
  programs.kitty = {
    enable = true;
    settings = {
      background_opacity = "1";
      font_family = "FiraCode Nerd Font";
      font_size = "13.5";
      disable_ligatures = "never";
      cursor_shape = "underline";
      cursor_blink_interval = "0.5";
      cursor_stop_blinking_after = "15.0";
      scrollback_lines = 10000;
      click_interval = "0.5";
      select_by_word_characters = ":@-./_~?&=%+#";
      remember_window_size = false;
      allow_remote_control = true;
      initial_window_width = 640;
      initial_window_height = 400;
      line_height = "4.5";
      repaint_delay = 15;
      input_delay = 2;
      visual_bell_duration = "0.0";
      url_style = "double";
      open_url_with = "default";
      confirm_os_window_close = 0;
      enable_audio_bell = false;
      window_padding_width = 2;
      window_margin_width = 2;
      foreground = "#79B8FF";
      background = "#1F1F1F";
      selection_foreground = "#1F1F1F";
      selection_background = "#F5E0DC";
      cursor = "#F5E0DC";
      cursor_text_color = "#1F1F1F";

      # URL underline color when hovering with mouse
      url_color = "#F5E0DC";

      # Kitty window border colors
      active_border_color = "#B4BEFE";
      inactive_border_color = "#6C7086";
      bell_border_color = "#F9E2AF";

      # OS Window titlebar colors
      wayland_titlebar_color = "system";
      macos_titlebar_color = "system";

      # Tab bar colors
      active_tab_foreground = "#11111B";
      active_tab_background = "#CBA6F7";
      inactive_tab_foreground = "#CDD6F4";
      inactive_tab_background = "#181825";
      tab_bar_background = "#11111B";

      # # Colors for marks (marked text in the terminal)
      # mark1_foreground = "#1F1F1F";
      # mark1_background = "#B4BEFE";
      # mark2_foreground = "#1F1F1F";
      # mark2_background = "#CBA6F7";
      # mark3_foreground = "#1F1F1F";
      # mark3_background = "#74C7EC";

      # # The 16 terminal colors
      # color0 = "#45475A";
      # color8 = "#585B70";
      # color1 = "#F38BA8";
      # color9 = "#F38BA8";
      # color2 = "#A6E3A1";
      # color10 = "#A6E3A1";
      # color3 = "#F9E2AF";
      # color11 = "#F9E2AF";
      # color4 = "#206686";
      # color12 = "#206686";
      # color5 = "#F5C2E7";
      # color13 = "#F5C2E7";
      # color6 = "#94E2D5";
      # color14 = "#94E2D5";
      # color7 = "#BAC2DE";
      # color15 = "#BAC2DE";
    };
  };
}
