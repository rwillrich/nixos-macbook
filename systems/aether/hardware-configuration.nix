{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}:
{
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  boot.initrd.availableKernelModules = [
    "xhci_pci"
    "ehci_pci"
    "ahci"
    "firewire_ohci"
    "usbhid"
    "usb_storage"
    "sd_mod"
    "sr_mod"
    "sdhci_pci"
  ];
  boot.initrd.kernelModules = [
    "wl"
    "i915"
  ];
  boot.kernelModules = [
    "kvm-intel"
    "wl"
  ];
  boot.kernelParams = [
    "intremap=off"
    "i915.enable_rc6=7"
  ];
  boot.extraModulePackages = [ config.boot.kernelPackages.broadcom_sta ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

  hardware.graphics.extraPackages = [
    ((pkgs.intel-vaapi-driver or pkgs.vaapiIntel).override {
      enableHybridCodec = true;
    })
    pkgs.intel-ocl
  ];

  hardware.graphics.extraPackages32 = [
    (
      (pkgs.driversi686Linux.intel-vaapi-driver or pkgs.driversi686Linux.vaapiIntel)
      .override
        { enableHybridCodec = true; }
    )
  ];

  hardware.facetimehd.enable = true;

  services.mbpfan.enable = true;

  services.fstrim.enable = true;
}
