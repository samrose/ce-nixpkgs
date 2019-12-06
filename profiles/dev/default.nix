{ config, lib, pkgs, ... }:

with pkgs;

{
  imports = [
    ../.
  ];
  environment.noXlibs = true;
  services.mingetty.autologinUser = "root";


}
