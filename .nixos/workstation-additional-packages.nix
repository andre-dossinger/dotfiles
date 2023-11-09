# contains additional packages needed for current development tasks

{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    terraform
  ];
}

