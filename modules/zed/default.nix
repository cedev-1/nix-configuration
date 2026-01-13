{ config, pkgs, ... }:

{
  home.packages = [ pkgs.zed-editor ];

  programs.zed-editor = {
    enable = true;
    userSettings = {
      buffer_font_weight = 400.0;
      terminal = {
        font_family = "Adwaita Sans";
        font_size = 12.0;
        shell = "system";
      };
      outline_panel = {
        file_icons = true;
      };
      project_panel = {
        sticky_scroll = true;
        scrollbar = {
          show = "never";
        };
        git_status = true;
        folder_icons = true;
        file_icons = true;
        entry_spacing = "comfortable";
      };
      tabs = {
        git_status = false;
      };
      title_bar = {
        show_menus = false;
        show_sign_in = true;
        show_branch_icon = true;
      };
      autosave = "on_focus_change";
      telemetry = {
        diagnostics = false;
        metrics = false;
      };
      agent = {
        always_allow_tool_actions = true;
        enable_feedback = false;
        default_model = {
          provider = "copilot_chat";
          model = "grok-code-fast-1";
        };
        model_parameters = [ ];
      };
      base_keymap = "VSCode";
      ui_font_size = 16;
      buffer_font_size = 12.0;
      theme = {
        mode = "system";
        light = "One Light";
        dark = "One Dark";
      };
      tab_bar = {
        show = true;
        show_nav_history_buttons = false;
      };
      collaboration_panel = {
        button = false;
      };
    };
  };
}