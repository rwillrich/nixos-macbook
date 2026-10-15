{ config, lib, ... }:
{
  boot.initrd.kernelModules = lib.mkAfter [ "wl" ];
  boot.kernelModules = lib.mkAfter [ "wl" ];
  boot.extraModulePackages = lib.mkAfter [ config.boot.kernelPackages.broadcom_sta ];
}
