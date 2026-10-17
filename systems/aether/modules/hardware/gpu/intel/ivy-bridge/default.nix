{
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [ ../. ];

  boot.initrd.kernelModules = lib.mkAfter [ "i915" ];

  hardware.graphics.extraPackages = lib.mkAfter [
    pkgs.intel-vaapi-driver
    pkgs.intel-ocl
  ];

  hardware.graphics.extraPackages32 = lib.mkAfter [
    pkgs.driversi686Linux.intel-vaapi-driver
  ];
}
