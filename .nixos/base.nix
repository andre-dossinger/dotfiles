# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{

  # bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # network setup
  networking = {
    hostName = "nixos";
    useDHCP = true;
  };

  # set time zone
  time.timeZone = "Europe/Berlin";
  services.ntp.enable = true;

  # internationalisation properties
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };

  # configure X11
  services.xserver = {
    layout = "de";
    xkbVariant = "";

    enable = true;
    desktopManager.xterm.enable = false;
    desktopManager.xfce = {
      enable = true;
      noDesktop = true;
      enableXfwm = false;
    };
    displayManager.defaultSession = "xfce+i3";
    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        dmenu
	      i3status
	      i3lock
	      i3blocks
      ];
    };
  };

  # auto cleanup
  nix.settings.auto-optimise-store = true;
  nix.gc = {
    automatic = true;
    dates = "daily";
    options = "--delete-older-than 30d";
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.autoUpgrade = {
    enable = true;
    dates = "11:00";
  };

  # configure console keymap
  console.keyMap = "de";

  # user account - do not forget to set a password with ‘passwd’
  users.users.ad = {
    isNormalUser = true;
    description = "ad";
    extraGroups = [
      "wheel"
      "docker"
    ];
    packages = with pkgs; [];
  };

  fonts.packages = with pkgs; [
    nerdfonts
  ];

  # packages installed in system profile
  environment.systemPackages = with pkgs; [
    wget
    curl
    jq
    ripgrep
    neovim
    xclip
    alacritty
    git
    rsync
    feh
    gnumake
    vim
    gcc
    zip
    unzip
    nodejs_20
    firefox
    htop
  ];

  virtualisation.docker.enable = true;

  # zsh
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
  environment.shells = with pkgs; [ zsh ];

  # enabled services
  services.spice-vdagentd.enable = true;
  services.openssh.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?
}
