{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./base.nix
      #./workstation.nix
      #./vm-workstation.nix
      ./server.nix
      ./node-002.nix
      ./node-002.secret.nix
    ];
}
