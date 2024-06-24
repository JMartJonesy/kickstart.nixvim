{ config, pkgs, inputs, ... }:

{
  # https://nix-community.github.io/nixvim/plugins/neo-tree/index.html?highlight=neo-tree#pluginsneo-treepackage
  #
  # Neo-tree is a Neovim plugin to browse the file system
  programs.nixvim = {
    plugins.neo-tree = {
      enable = true;

      filesystem = {
        window = {
          mappings = {
            "\\" = "close_window";
          };
        };
      };
    };

    keymaps = [
      {
        key = "\\";
        action = "<cmd>Neotree reveal<cr>";
        options = {
          desc = "NeoTree reveal";
        };
      }
    ];
  };
}
