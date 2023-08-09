{pkgs, ...}: {
  home.packages = [
    (pkgs.makeDesktopItem {
      name = "nvim";
      desktopName = "nvim";
      terminal = true;
      categories = ["Utility" "TextEditor" "Development" "IDE"];
      mimeTypes = [
        "inode/directory"
        "text/english"
        "text/plain"
        "text/x-makefile"
        "text/x-c++hdr"
        "text/x-c++src"
        "text/x-chdr"
        "text/x-csrc"
        "text/x-java"
        "text/x-moc"
        "text/x-pascal"
        "text/x-tcl"
        "text/x-tex"
        "application/x-shellscript"
        "application/json"
        "application/xml"
        "text/xml"
        "text/x-c"
        "text/x-c++"
      ];
      exec = "${pkgs.neovim}/bin/nvim %F";
      icon = "nvim";
    })
  ];
}
