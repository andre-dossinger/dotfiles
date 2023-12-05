{ config, pkgs, ... }:

{

  imports = [
    /etc/nixos/hardware-configuration.nix
    ./base.nix
    ./server.nix
    ./k8s-server.nix
    ./k8s-server-subsequent-nodes.nix
    ./k8s-server.secret.nix
    ./node-002.secret.nix
  ];
  nix.nixPath = [
    "nixpkgs=/nix/var/nix/profiles/per-user/root/channels/nixos"
    "nixos-config=/home/ad/.nixos/node-002.leaf.nix"
    "/nix/var/nix/profiles/per-user/root/channels"
  ];

  networking = {
    hostName = "node-002";
    interfaces.enp2s0.ipv4.addresses = [ {
      address = "192.168.1.203";
      prefixLength = 24;
    } ];
  };

  system.autoUpgrade.rebootWindow = {
    lower = "03:00";
    upper = "03:30";
  };

  services.openiscsi.name = "iqn.2023-11.internal.lab.iscsi:${config.networking.hostName}"; # required for longhorn storage engine

}

