{ config, pkgs, theme, package, ... }:

{
  programs.rofi = {
    enable = true;
    inherit package;

    extraConfig = {
      display-drun = "";
      drun-display-format = "{name}";
      show-icons = true;
    };

    theme =
      import ./theme.nix { inherit config theme; };
  };
}