{
  config,
  lib,
  pkgs,
  ...
}:
{
  nixpkgs.overlays = [
    (final: prev: {
      linuxPackages_latest = prev.linuxPackages_latest.extend (
        lpself: lpsuper: {
          facetimehd = prev.linuxPackages_latest.facetimehd.overrideAttrs (old: rec {
            inherit (old) pname;
            name = "${pname}-${version}-${prev.linuxPackages_latest.kernel.version}";
            version = "0.7.2";
            src = prev.fetchFromGitHub {
              owner = "patjak";
              repo = "facetimehd";
              rev = "0.7.2";
              sha256 = "sha256-l0bmbkjjqjTXpyAAP7jAxSafg9kQgv2BmK7Oki5n0Iw=";
            };
          });
        }
      );
    })
  ];

  boot.loader.grub.configurationName = "Next";

  boot.kernelPackages = pkgs.linuxPackages_latest;
}
