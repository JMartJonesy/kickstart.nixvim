{ config, pkgs, inputs, ... }:

{
  programs.nixvim = {
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

    plugins.conform-nvim = { # Autoformat
      enable = true;
      notifyOnError = false;
      formatOnSave = ''
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
      formattersByFt = {
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
}
