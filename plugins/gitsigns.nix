{
  programs.nixvim = {
    # Adds git related signs to the gutter, as well as utilities for managing changes
    # See `:help gitsigns` to understand what the configuration keys do
    # https://nix-community.github.io/nixvim/plugins/gitsigns/index.html
    plugins.gitsigns = {
      enable = true;
      settings = {
        signs = {
          add = {text = "+";};
          change = {text = "~";};
          delete = {text = "_";};
          topdelete = {text = "‾";};
          changedelete = {text = "~";};
        };
      };
    };

    # NOTE: add gitsigns recommended keymaps if you are interested
    /*
       # https://nix-community.github.io/nixvim/keymaps/index.html
       keymaps = [
         # Navigation
         {
           mode = "n";
    key = "]c";
    action.__raw = ''
      function()
        if vim.wo.diff then
          vim.cmd.normal { ']c', bang = true }
        else
          require('gitsigns').nav_hunk 'next'
        end
      end
    '';
    options = {
      desc = "Jump to next git [C]hange";
    };
         }
         {
           mode = "n";
    key = "[c";
    action.__raw = ''
      function()
        if vim.wo.diff then
          vim.cmd.normal { '[c', bang = true }
        else
          require('gitsigns').nav_hunk 'prev'
        end
      end
    '';
    options = {
      desc = "Jump to previous git [C]hange";
    };
         }
         # Actions
         # visual mode
         {
           mode = "v";
    key = "<leader>hs";
    action.__raw = ''
      function()
        require('gitsigns').stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
      end
    '';
    options = {
      desc = "stage git hunk";
    };
         }
         {
           mode = "v";
    key = "<leader>hr";
    action.__raw = ''
      function()
        require('gitsigns').reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
      end
    '';
    options = {
      desc = "reset git hunk";
    };
         }
         # normal mode
         {
           mode = "n";
    key = "<leader>hs";
    action.__raw = ''
      function()
        require('gitsigns').stage_hunk()
      end
    '';
    options = {
      desc = "git [s]tage hunk";
    };
         }
         {
           mode = "n";
    key = "<leader>hr";
    action.__raw = ''
      function()
        require('gitsigns').reset_hunk()
      end
    '';
    options = {
      desc = "git [r]eset hunk";
    };
         }
         {
           mode = "n";
    key = "<leader>hS";
    action.__raw = ''
      function()
        require('gitsigns').stage_buffer()
      end
    '';
    options = {
      desc = "git [S]tage buffer";
    };
         }
         {
           mode = "n";
    key = "<leader>hu";
    action.__raw = ''
      function()
        require('gitsigns').undo_stage_hunk()
      end
    '';
    options = {
      desc = "git [u]ndo stage hunk";
    };
         }
         {
           mode = "n";
    key = "<leader>hR";
    action.__raw = ''
      function()
        require('gitsigns').reset_buffer()
      end
    '';
    options = {
      desc = "git [R]eset buffer";
    };
         }
         {
           mode = "n";
    key = "<leader>hp";
    action.__raw = ''
      function()
        require('gitsigns').preview_hunk()
      end
    '';
    options = {
      desc = "git [p]review hunk";
    };
         }
         {
           mode = "n";
    key = "<leader>hb";
    action.__raw = ''
      function()
        require('gitsigns').blame_line()
      end
    '';
    options = {
      desc = "git [b]lame line";
    };
         }
         {
           mode = "n";
    key = "<leader>hd";
    action.__raw = ''
      function()
        require('gitsigns').diffthis()
      end
    '';
    options = {
      desc = "git [d]iff against index";
    };
         }
         {
           mode = "n";
    key = "<leader>hD";
    action.__raw = ''
      function()
        require('gitsigns').diffthis '@'
      end
    '';
    options = {
      desc = "git [D]iff against last commit";
    };
         }
         # Toggles
         {
           mode = "n";
    key = "<leader>tb";
    action.__raw = ''
      function()
        require('gitsigns').toggle_current_line_blame()
      end
    '';
    options = {
      desc = "[T]oggle git show [b]lame line";
    };
         }
         {
           mode = "n";
    key = "<leader>tD";
    action.__raw = ''
      function()
        require('gitsigns').toggle_deleted()
      end
    '';
    options = {
      desc = "[T]oggle git show [D]eleted";
    };
         }
       ];
    */
  };
}
