{ config, pkgs, ... }:

{

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

