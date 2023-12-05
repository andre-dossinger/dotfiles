{ config, pkgs, ... }:

{

  imports = [
    /etc/nixos/hardware-configuration.nix
    ./base.nix
    ./server.nix
    ./k8s-server.nix
    ./k8s-server.secret.nix
    ./node-001.secret.nix
  ];
  nix.nixPath = [
    "nixpkgs=/nix/var/nix/profiles/per-user/root/channels/nixos"
    "nixos-config=/home/ad/.nixos/node-002.leaf.nix"
    "/nix/var/nix/profiles/per-user/root/channels"
  ];

  networking = {
    hostName = "node-001";
    interfaces.enp2s0.ipv4.addresses = [ {
      address = "192.168.1.202";
      prefixLength = 24;
    } ];
  };

  system.autoUpgrade.rebootWindow = {
    lower = "02:15";
    upper = "02:45";
  };

  services.openiscsi.name = "iqn.node-001.internal.lab.iscsi:${config.networking.hostName}"; # required for longhorn storage engine

  # required since k3s init node
  services.k3s.clusterInit = true;

}

