{ config, lib, pkgs, ... }:

{
programs.rofi.enable = true;
xdg.configFile."rofi/config.rasi".text = ''
  configuration {
    font: "Monospace 16";
    show-icons: true;
    icon-theme: "Papirus";
    display-drun: "";
    display-window: "﩯 ";
    display-combi: "  ";
  }
  @theme "solarized"
  '';
}