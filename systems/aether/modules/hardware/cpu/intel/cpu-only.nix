{ config, lib, ... }: {
  boot.kernelModules = lib.mkAfter [ "kvm-intel" ];

  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
