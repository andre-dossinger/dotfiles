{ config, pkgs, ... }:

{

  imports = [
    /etc/nixos/hardware-configuration.nix
    ./base.nix
    ./workstation.nix
  ];
  nix.nixPath = [
    "nixpkgs=/nix/var/nix/profiles/per-user/root/channels/nixos"
    "nixos-config=/home/ad/.nixos/vm-workstation.leaf.nix"
    "/nix/var/nix/profiles/per-user/root/channels"
  ];

  networking = {
    hostName = "vm-workstation";
  };

  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    terraform
    go
  ];

  services.spice-vdagentd.enable = true;

}

