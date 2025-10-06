{
  description = "Nix/Nixvim implementation of kickstart.nvim";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixvim.url = "github:nix-community/nixvim";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs =
    {
      nixpkgs,
      nixvim,
      flake-parts,
      ...
    }@inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {

      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];

      perSystem =
        { pkgs, system, ... }:
        let
          nixvimLib = nixvim.lib.${system};
          nixvim' = nixvim.legacyPackages.${system};
          # Use makeNixvimWithModule for proper module support
          nixvimModule = {
            inherit pkgs;
            module = import ./config;
            extraSpecialArgs = { };
          };
          nvim = nixvim'.makeNixvimWithModule nixvimModule;
        in
        {
          packages.default = nvim;
          apps.default = {
            type = "app";
            program = "${nvim}/bin/nvim";
          };

          # Optional: Add checks back if you want CI validation
          checks.default = nixvimLib.check.mkTestDerivationFromNixvimModule nixvimModule;

          # Optional: Add formatter
          formatter = pkgs.alejandra;
        };

      flake = {
        nixosModules.default =
          {
            config,
            pkgs,
            lib,
            ...
          }:
          {
            imports = [ inputs.nixvim.nixosModules.nixvim ];
            programs.nixvim = import ./nixvim.nix { inherit pkgs lib config; };
          };

        homeManagerModules.default =
          {
            config,
            pkgs,
            lib,
            ...
          }:
          {
            imports = [ inputs.nixvim.homeModules.nixvim ];
            programs.nixvim = import ./nixvim.nix { inherit pkgs lib config; };
          };

        darwinModules.default =
          {
            config,
            pkgs,
            lib,
            ...
          }:
          {
            imports = [ inputs.nixvim.darwinModules.nixvim ];
            programs.nixvim = import ./nixvim.nix { inherit pkgs lib config; };
          };
      };
    };
}
