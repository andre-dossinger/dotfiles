{ config, pkgs, ... }:

{

  networking = {
    useDHCP = true;
  };

  environment.systemPackages = with pkgs; [
    gnome.nautilus
  ];

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

}

