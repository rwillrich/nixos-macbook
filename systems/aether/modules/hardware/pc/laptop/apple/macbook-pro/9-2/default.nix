{ lib, ... }: {
  imports = [
    ../../../../../cpu/intel/ivy-bridge
    ../../../../../network/broadcom/bcm43xx
    ../../../../ssd
    ../.
  ];

  boot.kernelParams = lib.mkAfter [ "intremap=off" ];
}
