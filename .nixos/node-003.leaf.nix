{ config, pkgs, ... }:

{

  imports = [
    /etc/nixos/hardware-configuration.nix
    ./base.nix
    ./server.nix
    ./k8s-server.nix
    ./k8s-server-subsequent-nodes.nix
    ./k8s-server.secret.nix
    ./node-003.secret.nix
  ];
  nix.nixPath = [
    "nixpkgs=/nix/var/nix/profiles/per-user/root/channels/nixos"
    "nixos-config=/home/ad/.nixos/node-003.leaf.nix"
    "/nix/var/nix/profiles/per-user/root/channels"
  ];

  networking = {
    hostName = "node-003";
    interfaces.enp2s0.ipv4.addresses = [ {
      address = "192.168.1.204";
      prefixLength = 24;
    } ];
  };

  system.autoUpgrade.rebootWindow = {
    lower = "03:45";
    upper = "04:15";
  };

  services.openiscsi.name = "iqn.node-003.internal.lab.iscsi:${config.networking.hostName}"; # required for longhorn storage engine

}

