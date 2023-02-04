{ pkgs, ... }:

{
  gtk = {
    enable = true;
    theme = {
      name = "Dracula";
      package = pkgs.dracula-theme;
    };
    font = {
      name = "JetBrains Mono Nerd Font";
      package = pkgs.nerdfonts;
      size = 16;
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };

    cursorTheme = {
      name = "Numix-Cursor";
      package = pkgs.numix-cursor-theme;
    };
    gtk3.extraConfig = {
      gtk-icon-theme-name   = "Papirus-Dark";
      gtk-cursor-theme-name = "Numix-Cursor";
    };
    gtk4.extraConfig = {
      gtk-icon-theme-name   = "Papirus-Dark";
      gtk-cursor-theme-name = "Numix-Cursor";
    };
  };

  dconf = {
    enable = true;
    settings = {
    "org/gnome/desktop/interface" = {
      cursor-theme = "Numix-Cursor";
    };
  };
};

  xdg.systemDirs.data = [
    "${pkgs.gtk3}/share/gsettings-schemas/${pkgs.gtk3.name}"
    "${pkgs.gtk4}/share/gsettings-schemas/${pkgs.gtk4.name}"
    "${pkgs.gsettings-desktop-schemas}/share/gsettings-schemas/${pkgs.gsettings-desktop-schemas.name}"
  ];
}