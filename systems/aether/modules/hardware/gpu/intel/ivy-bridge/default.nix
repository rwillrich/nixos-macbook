{ config, lib, pkgs, ... }:
{
  imports = [
    ../.
  ];

  boot.initrd.kernelModules = lib.mkAfter [ "i915" ];

  hardware.graphics.extraPackages = lib.mkAfter [
    pkgs.intel-vaapi-driver
  ];

  hardware.graphics.extraPackages32 = lib.mkAfter [
    pkgs.driversi686Linux.intel-vaapi-driver
  ];
}
