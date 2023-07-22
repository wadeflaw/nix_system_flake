{pkgs, ...}:{
  xdg.configFile = {
    "btop/themes/catppuccin_mocha.theme".source = ./catppuccin_mocha.theme;
  };

  programs.btop = {
    enable = true;
    settings = {
    color_theme = "catppuccin_mocha";

    theme_background = false;

    truecolor = true;

    force_tty = false;

    vim_keys = true;

    rounded_corners = true;

    graph_symbol = "block";

    graph_symbol_cpu = "default";

    graph_symbol_mem = "default";

    graph_symbol_net = "default";

    graph_symbol_proc = "default";

    shown_boxes = "proc";

    update_ms = "500";

    proc_sorting = "memory";

    proc_reversed = false;

    proc_tree = false;

    proc_colors = true;

    proc_gradient = true;

    proc_per_core = true;

    proc_mem_bytes = true;

    proc_cpu_graphs = true;

    proc_info_smaps = false;

    proc_left = false;

    proc_filter_kernel = false;

    cpu_graph_upper = "total";

    cpu_graph_lower = "total";

    cpu_invert_lower = true;

    cpu_single_graph = false;

    cpu_bottom = true;

    show_uptime = true;

    check_temp = true;

    cpu_sensor = "Auto";

    show_coretemp = true;

    temp_scale = "celsius";

    base_10_sizes = false;

    show_cpu_freq = true;

    clock_format = "%X";

    background_update = false;

    mem_graphs = true;

    mem_below_net = false;

    zfs_arc_cached = true;

    show_swap = false;

    show_battery = false;

    selected_battery = "Auto";

    log_level = "ERROR";
    };
  };
}
