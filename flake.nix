{
  description = "Nix/Nixvim implementation of kickstart.nvim";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = { nixpkgs, flake-parts, nixvim, ... } @ inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];

      perSystem = { pkgs, system, ... }: let
        nixvimLib = nixvim.lib.${system};
        nixvim' = nixvim.legacyPackages.${system};
        nixvimModule = {
          inherit pkgs;
          module = import ./nixvim.nix;
          extraSpecialArgs = {};
        };
        nvim = nixvim'.makeNixvimWithModule nixvimModule;
      in {
        packages.default = nvim;
        checks.default = nixvimLib.check.mkTestDerivationFromNixvimModule nixvimModule;
        formatter = pkgs.alejandra;
      };

      flake = {
        nixosModules.default = { config, pkgs, lib, ... }: {
          imports = [ inputs.nixvim.nixosModules.nixvim ];
          programs.nixvim = import ./nixvim.nix { inherit pkgs lib config; };
        };

        homeManagerModules.default = { config, pkgs, lib, ... }: {
          imports = [ inputs.nixvim.homeManagerModules.nixvim ];
          programs.nixvim = import ./nixvim.nix { inherit pkgs lib config; };
        };

        darwinModules.default = { config, pkgs, lib, ... }: {
          imports = [ inputs.nixvim.darwinModules.nixvim ];
          programs.nixvim = import ./nixvim.nix { inherit pkgs lib config; };
        };
      };
    };
}

