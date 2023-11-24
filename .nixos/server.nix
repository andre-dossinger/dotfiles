{ config, pkgs, ... }:

{

  services.btrfs.autoScrub.enable = true;
  services.btrfs.autoScrub.interval = "daily";

  networking = {
    defaultGateway = "192.168.1.1";
    nameservers = [ "192.168.1.2" ];
  };

  system.autoUpgrade = {
    allowReboot = true;
  };

}

