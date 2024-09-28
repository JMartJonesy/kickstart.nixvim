{pkgs, ...}: {
  programs.nixvim = {
    # Dependencies
    #
    # https://nix-community.github.io/nixvim/NeovimOptions/index.html?highlight=extraplugins#extrapackages
    extraPackages = with pkgs; [
      # Used to format Lua code
      stylua
    ];

    # Autoformat
    # https://nix-community.github.io/nixvim/plugins/conform-nvim.html
    plugins.conform-nvim = {
      enable = true;
      settings = {
        notify_on_error = false;
        format_on_save = ''
          function(bufnr)
            -- Disable "format_on_save lsp_fallback" for lanuages that don't
            -- have a well standardized coding style. You can add additional
            -- lanuages here or re-enable it for the disabled ones.
            local disable_filetypes = { c = true, cpp = true }
            return {
              timeout_ms = 500,
              lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype]
            }
          end
        '';
        formatters_by_ft = {
          lua = ["stylua"];
          # Conform can also run multiple formatters sequentially
          # python = [ "isort "black" ];
          #
          # You can use a sublist to tell conform to run *until* a formatter
          # is found
          # javascript = [ [ "prettierd" "prettier" ] ];
        };
      };
    };

    # https://nix-community.github.io/nixvim/keymaps/index.html
    keymaps = [
      {
        mode = "";
        key = "<leader>f";
        action.__raw = ''
          function()
            require('conform').format { async = true, lsp_fallback = true }
          end
        '';
        options = {
          desc = "[F]ormat buffer";
        };
      }
    ];
  };
}
