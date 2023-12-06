{ config, pkgs, ... }:

{

  networking.firewall.allowedTCPPorts = [
    6443 # k3s: required so that pods can reach the API server (running on port 6443 by default)
    2379 # k3s, etcd clients: required if using a "High Availability Embedded etcd" configuration
    2380 # k3s, etcd peers: required if using a "High Availability Embedded etcd" configuration
    80
    443
  ];
  networking.firewall.allowedUDPPorts = [
    8472 # k3s, flannel: required if using multi-node for inter-node networking
  ];

  environment.systemPackages = with pkgs; [
    kubectl
    openiscsi
    nfs-utils
  ];

  # workaround for longhorn node storage access
  system.activationScripts.usrlocalbin = ''
    mkdir -m 0755 -p /usr/local
    ln -nsf /run/current-system/sw/bin /usr/local/
  '';
  services.openiscsi = {
    enable = true;
    # name = "iqn.node-00X.internal.lab.iscsi:${config.networking.hostName}"; # found in node specific nix configuration
  };

  # In case of issues reset k3s using: ´sudo rm -rf /var/lib/rancher´ and rebuild nixos
  services.k3s = {
    enable = true;
    role = "server";
    extraFlags = toString [
      "--disable=traefik,servicelb"
      "--write-kubeconfig-mode=0644"
    ];
  };

}

