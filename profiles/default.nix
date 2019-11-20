{ pkgs, ... }:


{
   //environment.systemPackages = [ pkgs.emacs ];
   services.mingetty.autologinUser = "root";
}
