final: previous:

with final;
with lib;

let

npm-to-nix = fetchFromGitHub {
  owner = "transumption-unstable";
  repo = "npm-to-nix";
  rev = "6d2cbbc9d58566513019ae176bab7c2aeb68efae";
  sha256 = "1wm9f2j8zckqbp1w7rqnbvr8wh6n072vyyzk69sa6756y24sni9a";
};
in

{
  buildImage = imports:
    let
      system = nixos {
        inherit imports;
      };

      imageNames = filter (name: hasAttr name system) [
        "isoImage"
        "sdImage"
        "virtualBoxOVA"
        "vm"
      ];
    in
    head (attrVals imageNames system);

  example = callPackage ./example {};

  ce-nixpkgs = recurseIntoAttrs {
    profile = tryDefault <nixos-config> ../../profiles;

    qemu = buildImage [
      ../../profiles/hardware/qemu
      ce-nixpkgs.profile
    ];
  };

  tryDefault = x: default:
    let
      eval = builtins.tryEval x;
    in
    if eval.success then eval.value else default;

  inherit (callPackage npm-to-nix {}) npmToNix;
}
