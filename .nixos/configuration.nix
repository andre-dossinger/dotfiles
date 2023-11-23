# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./base.nix
      #./workstation.nix
      ./server.nix
      ./node-002.nix
      ./node-002.secret.nix
    ];
}
