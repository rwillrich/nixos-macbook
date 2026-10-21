{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    flake-parts.url = "github:hercules-ci/flake-parts";
    flake-parts.inputs.nixpkgs-lib.follows = "nixpkgs";

    disko.url = "github:nix-community/disko/latest";
    disko.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } (
      toplevel@{ lib, inputs, ... }:
      let
        inherit (inputs) disko;
      in
      {
        systems = [ "x86_64-linux" ];

        flake.nixosConfigurations.aether = lib.nixosSystem {
          modules = [
            ./systems/aether/configuration.nix
            disko.nixosModules.disko
          ];
        };

        perSystem = { pkgs, ... }: {
          devShells.default = pkgs.mkShellNoCC {
            packages = with pkgs; [
              treefmt
              nixfmt
              taplo
              shfmt
              prettier
              nvd
            ];
          };
        };
      }
    );
}
