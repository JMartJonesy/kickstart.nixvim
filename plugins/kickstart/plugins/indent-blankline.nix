{ config, pkgs, inputs, ... }:

{
  # https://nix-community.github.io/nixvim/plugins/indent-blankline/index.html
  #
  # Add indentation guides even on blank lines
  # For configuration see `:help ibl`
  programs.nixvim = {
    plugins.indent-blankline = {
      enable = true;
    };
  };
}
