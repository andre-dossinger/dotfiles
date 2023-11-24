{ config, pkgs, ... }:

{

  networking = {
    hostName = "node-002";
    interfaces.enp2s0.ipv4.addresses = [ {
      address = "192.168.1.203";
      prefixLength = 24;
    } ];
    defaultGateway = "192.168.1.1";
    nameservers = [ "192.168.1.2" ];
  };

  system.autoUpgrade.rebootWindow = {
    lower = "03:00";
    upper = "03:30";
  };

}

