{ config, pkgs, inputs, ... }:

{
  # https://nix-community.github.io/nixvim/plugins/nvim-autopairs/index.html?highlight=autopairs#nvim-autopairs
  programs.nixvim = {
    plugins.nvim-autopairs = {
      enable = true;
    };

    # If you want to automatically add `(` after selecting a function or method
    extraConfigLua = ''
      require('cmp').event:on('confirm_done', require('nvim-autopairs.completion.cmp').on_confirm_done())
    '';
  };
}
