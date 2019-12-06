{ pkgs, ... }:


{
  imports = [ ../modules ];

  nixpkgs.overlays = [ (import ../overlays/ce-nixpkgs) ];
}
