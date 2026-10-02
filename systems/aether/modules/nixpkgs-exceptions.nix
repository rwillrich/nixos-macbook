{ lib, ... }:
let
  packageNameIn = names: pkg: lib.elem (lib.getName pkg) names;
in
{
  nixpkgs.config = {
    allowUnfreePredicate = packageNameIn [
      "1password"
      "1password-cli"
      "broadcom-sta"
      "intel-ocl"
      "facetimehd-firmware"
    ];

    allowInsecurePredicate = packageNameIn [ "broadcom-sta" ];
  };
}
