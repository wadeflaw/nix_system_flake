{...}: {
  programs.zathura = {
    enable = true;
    extraConfig = ''
      set adjust-open "best-fit"
      set pages-per-row 1
      set scroll-page-aware "true"
      set scroll-full-overlap 0.01
      set scroll-step 100
      set selection-clipboard clipboard

      set zoom-min 10
      set guioptions ""

      set default-bg "#24273A"
      set default-fg "#CAD3F5"

      set recolor "true"
      set recolor-lightcolor "#24273A"
      set recolor-darkcolor "#CAD3F5"
      set recolor-reverse-video "true"
      set recolor-keephue "true"


      set render-loading "false"
      set scroll-step 200
      unmap f
      map f toggle_fullscreen
      map [fullscreen] f toggle_fullscreen

      set default-fg                "#cad3f5"
      set default-bg 			          "#1E1E2E"

      set completion-bg		          "#313244"
      set completion-fg		          "#cad3f5"
      set completion-highlight-bg	  "#575268"
      set completion-highlight-fg	  "#cad3f5"
      set completion-group-bg		    "#313244"
      set completion-group-fg		    "#89B4FA"

      set statusbar-fg		          "#cad3f5"
      set statusbar-bg		          "#313244"

      set notification-bg		        "#313244"
      set notification-fg		        "#cad3f5"
      set notification-error-bg	    "#313244"
      set notification-error-fg	    "#F38BA8"
      set notification-warning-bg	  "#313244"
      set notification-warning-fg	  "#FAE3B0"

      set inputbar-fg			          "#cad3f5"
      set inputbar-bg 		          "#313244"

      set recolor-lightcolor		    "#1E1E2E"
      set recolor-darkcolor		      "#cad3f5"

      set index-fg			            "#cad3f5"
      set index-bg			            "#1E1E2E"
      set index-active-fg		        "#cad3f5"
      set index-active-bg		        "#313244"

      set render-loading-bg		      "#1E1E2E"
      set render-loading-fg		      "#cad3f5"

      set highlight-color		        "#575268"
      set highlight-fg              "#F5C2E7"
      set highlight-active-color	  "#F5C2E7"
    '';
  };
}
