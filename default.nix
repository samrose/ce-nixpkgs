{ ... } @ args: import (import ./vendor/nixpkgs.nix) (args // {
  overlays = [ (import ./overlays/ce-nixpkgs) ] ++ (args.overlays or []);
})
