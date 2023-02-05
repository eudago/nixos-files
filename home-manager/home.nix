# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)

{ inputs, lib, config, pkgs, ... }: {
  # You can import other home-manager modules here
  imports = [
    # If you want to use home-manager modules from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModule

    # You can also split up your configuration and import pieces of it here:
    # ./nvim.nix
    ./waybar.nix
    ./gtk.nix
    ./alacritty.nix
    ./rofi.nix
	./wofi/wofi.nix
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # If you want to use overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = (_: true);
    };
  };

  home = {
    username = "eudago";
    homeDirectory = "/home/eudago";
  };

  # Add stuff for your user as you see fit:
  # programs.neovim.enable = true;
  # home.packages = with pkgs; [ steam ];
  programs.home-manager.enable = true;
  home.packages = with pkgs; [
	_1password-gui
	bat
	fzf
	ripgrep
	nerdfonts
	jq
	starship
	tree
	exa
	mako
	pciutils
	swaybg
	swaylock-effects
	pamixer
	pavucontrol
	pulseaudio
	inputs.hyprwm-contrib.packages.${system}.grimblast
	dracula-theme
	xdg-desktop-portal-gtk
	gsettings-desktop-schemas
	spotify
	wlogout
	glib
	feh
	];
  
	home.sessionVariables = {
		QT_QPA_PLATFORM = "wayland";
		MOZ_ENABLE_WAYLAND=1;
		GDK_BACKEND="wayland";
		EDITOR="nvim";
	};
	home.shellAliases = {
		l = "exa";
		ls = "exa";
		cat = "bat";
	};

	programs.zsh = {
		enable = true;
		initExtra = ''
			${pkgs.dt-shell-color-scripts}/bin/colorscript -e 22
			'';
	};

	programs.zsh.oh-my-zsh= {
		enable = true;
		plugins = ["git" "python" "docker" "fzf"];
		theme = "dpoggi";
	};

	wayland.windowManager.hyprland = {
		enable = true;
		extraConfig = (import ./hyprland.nix); 
	};

	programs.waybar.package = pkgs.waybar.overrideAttrs (oa: {
		mesonFlags = (oa.mesonFlags or  [ ]) ++ [ "-Dexperimental=true" ];
	});	

  # Enable home-manager and git
	programs.firefox.enable = true;

  programs.git.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "22.11";
}
