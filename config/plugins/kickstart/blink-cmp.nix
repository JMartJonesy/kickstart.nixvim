{
  # `friendly-snippets` contains a variety of premade snippets
  #    See the README about individual language/framework/plugin snippets:
  #    https://github.com/rafamadriz/friendly-snippets
  # https://nix-community.github.io/nixvim/plugins/friendly-snippets.html
  # plugins.friendly-snippets = {
  #   enable = true;
  # };

  # Dependencies
  #
  # A snippet engine for Neovim
  #  https://nix-community.github.io/nixvim/plugins/luasnip/index.html
  plugins.luasnip.enable = true; # autoEnableSources not enough

  # Autocompletion
  # See `:help cmp`
  # https://nix-community.github.io/nixvim/plugins/cmp/index.html
  plugins.blink-cmp = {
    enable = true;

    settings = {

      keymap = {
        # 'default' (recommended) for mappings similar to built-in completions
        #   <c-y> to accept ([y]es) the completion.
        #    This will auto-import if your LSP supports it.
        #    This will expand snippets if the LSP sent a snippet.
        # 'super-tab' for tab to accept
        # 'enter' for enter to accept
        # 'none' for no mappings
        #
        # For an understanding of why the 'default' preset is recommended,
        # you will need to read `:help ins-completion`
        #
        # No, but seriously. Please read `:help ins-completion`, it is really good!
        #
        # All presets have the following mappings:
        # <tab>/<s-tab>: move to right/left of your snippet expansion
        # <c-space>: Open menu or open docs if already open
        # <c-n>/<c-p> or <up>/<down>: Select next/previous item
        # <c-e>: Hide menu
        # <c-k>: Toggle signature help
        #
        # See :h blink-cmp-config-keymap for defining your own keymap
        preset = "default";

        # For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
        #    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
      };

      appearance = {
        # 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        # Adjusts spacing to ensure icons are aligned
        nerd_font_variant = "mono";
      };

      completion = {
        # By default, you may press `<c-space>` to show the documentation.
        # Optionally, set `auto_show = true` to show the documentation after a delay.
        documentation = {
          auto_show = false;
          auto_show_delay_ms = 500;
        };
      };

      sources = {
        default = [
          "lsp"
          "path"
          "snippets"
          "lazydev"
        ];
        providers = {
          lazydev = {
            module = "lazydev.integrations.blink";
            score_offset = 100;
          };
        };
      };

      snippets = {
        preset = "luasnip";
      };

      # Blink.cmp includes an optional, recommended rust fuzzy matcher,
      # which automatically downloads a prebuilt binary when enabled.
      #
      # By default, we use the Lua implementation instead, but you may enable
      # the rust implementation via `'prefer_rust_with_warning'`
      #
      # See :h blink-cmp-config-fuzzy for more information
      fuzzy = {
        implementation = "lua";
      };

      # Shows a signature help window while you type arguments for a function
      signature = {
        enabled = true;
      };
    };
  };
}
